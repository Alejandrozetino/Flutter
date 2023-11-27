import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:productos_app/models/models.dart';

class ProductsService extends ChangeNotifier{
  
  final String baseUrl = 'productos-9c7b5-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  late Product selectedProuct;
  bool isLoading = true;
  bool isSaving = false;
  File? newPictureFile;
  final storage = new FlutterSecureStorage();
  
  ProductsService(){
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();

    //Petición al endpoint
    final url = Uri.https( baseUrl, 'Products.json', {
      'auth': await storage.read(key: 'token') ?? ''
    });
    
    //Espera la respuesta
    final resp = await http.get(url);
    //Obtiene el mapa
    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });

    isLoading = false;
    notifyListeners();

    return products;
  }

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();

    if(product.id == null){
      await createProduct(product);
    }else{
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    //Petición al endpoint
    final url = Uri.https( baseUrl, 'Products/${ product.id }.json', {
      'auth': await storage.read(key: 'token') ?? ''
    });

    //convertir a json para enviar al backend
    final resp = await http.put( url, body: product.toJson() );
    final decodedData = resp.body;

    final index = products.indexWhere(( element ) => element.id == product.id);
    products[index] = product;

    return product.id!;
  }

  Future<String> createProduct(Product product) async {
    //Petición al endpoint
    final url = Uri.https( baseUrl, 'Products.json', {
      'auth': await storage.read(key: 'token') ?? ''
    });
    //convertir a json para enviar al backend
    final resp = await http.post( url, body: product.toJson() );
    final decodedData = json.decode( resp.body );

    product.id = decodedData['name'];
    products.add(product);

    return product.id!;
  }

  void updateSelectedProductImage( String path ){

    selectedProuct.picture = path;
    newPictureFile = File.fromUri( Uri(path: path) );

    notifyListeners();

  }

  Future<String?> uploadImage() async {

    //Valida que venga una imagen seleccionada
    if( newPictureFile == null ) return null;

    isSaving == true;
    notifyListeners();

    //Url del endpoint para subir la imagen a Cloudinary
    final url = Uri.parse('https://api.cloudinary.com/v1_1/diuu7i2bp/image/upload?upload_preset=app_products');

    //Armar la petición
    final imageUploadRequest = http.MultipartRequest( 'POST', url );
    //Crear el archivo
    final file = await http.MultipartFile.fromPath( 'file', newPictureFile!.path );
    //Agregar el archivo a la petición
    imageUploadRequest.files.add(file);
    //Disparar la petición
    final streamResponse = await imageUploadRequest.send();
    final response = await http.Response.fromStream(streamResponse);

    if( response.statusCode != 200 && response.statusCode != 201 ){
      print('algo salio mal');
      print(response.body);
      return null;
    }

    newPictureFile = null;

    final decodedData = json.decode( response.body );
    return decodedData['secure_url'];
  }

}