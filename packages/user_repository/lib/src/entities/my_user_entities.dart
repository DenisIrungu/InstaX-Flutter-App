import 'package:equatable/equatable.dart';

class MyUserEntities extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? picture;

  const MyUserEntities({
    required this.id,
    required this.name,
    required this.email,
    this.picture
  });
  //Create a method toDocument/to JSON
  Map<String, Object?> toDocument(){
    return {
      'id': id,
      'name': name,
      'email': email,
      'picture': picture,
    };
  }
  //Create a fromDocument method
  static MyUserEntities fromDocument (Map<String, dynamic>doc){
    return MyUserEntities(
      id: doc['id'] as String, 
      name: doc['name']as String, 
      email: doc['email'] as String,
      picture: doc['picture'] as String?);
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [id, name,email,picture];
  
  @override
  String toString(){
    return '''UserEntities : {
      id: $id,
      name: $name,
      email: $email,
      picture: $picture,
    }''';
  }
}