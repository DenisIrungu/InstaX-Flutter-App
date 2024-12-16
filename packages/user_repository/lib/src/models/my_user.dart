import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

class MyUser extends Equatable{
  final String id;
  final String name;
  final String email;
  final String? picture;

  const MyUser({
    required this.id,
    required this.name,
    required this.email,
    this.picture
  });
  //Create an empty method
  static const empty = MyUser(
    id: '', 
    name: '', 
    email: '',
    picture: '');
  //Create a copyWith method to help in modifying the MyUser paarameters
  MyUser copyWith({
    String? id,
    String? name,
    String? email,
    String? picture,
  }
  ){
    return MyUser(
      id: id?? this.id, 
      name: name ?? this.name, 
      email: email ?? this.email, 
      picture: picture ?? this.picture);
  }
  //We need a getters to check whether MyUser is empty or not
  bool get isEmpty =>this == MyUser.empty;
  bool get isNotEmpty => this == MyUser.empty;

  //Create a toEntity method that will extend the MyUserEntity
  MyUserEntities toEntity(){
    return MyUserEntities(
      id: id,
      name: name,
      email: email,
      picture: picture
    );
  }
  //Create a fromEntity method 
  static MyUser fromEntity(MyUserEntities entity){
    return MyUser(
      id: entity.id, 
      name: entity.name, 
      email: entity.email,
      picture: entity.picture);
  }

   
  @override
  // TODO: implement props
  List<Object?> get props => [id,name,email,picture];
  
}