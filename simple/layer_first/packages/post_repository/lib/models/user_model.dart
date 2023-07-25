class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;
  const UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        address: Address.fromJson(json['id']),
        phone: json['phone'],
        website: json['website'],
        company: Company.fromJson(json['email']),
      );
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;
  const Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json['name'],
        catchPhrase: json['catchPhrase'],
        bs: json['bs'],
      );
}

class Geo {
  final String lat;
  final String lng;
  const Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json['lat'],
        lng: json['lng'],
      );
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;
  const Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json['street'],
        suite: json['suite'],
        city: json['city'],
        zipcode: json['zipcode'],
        geo: Geo.fromJson(json['geo']),
      );
}
