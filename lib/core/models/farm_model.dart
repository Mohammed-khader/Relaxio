class FarmsResponseModel {
  final bool? success;
  final Results? results;
  final String? error;

  FarmsResponseModel({
    this.success,
    this.results,
    this.error,
  });

  factory FarmsResponseModel.fromJson(Map<String, dynamic> json) {
    return FarmsResponseModel(
      success: json['success'] as bool?,
      results:
          json['results'] != null ? Results.fromJson(json['results']) : null,
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'results': results?.toJson(),
      'error': error,
    };
  }
}

class Results {
  final List<Farm>? data;
  final Meta? meta;
  final Links? links;

  Results({this.data, this.meta, this.links});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      data: (json['data'] as List?)?.map((e) => Farm.fromJson(e)).toList(),
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      links: json['links'] != null ? Links.fromJson(json['links']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
      'meta': meta?.toJson(),
      'links': links?.toJson(),
    };
  }
}

class Farm {
  final int? id;
  final int? userId;
  final int? cityId;
  final String? nameAr;
  final String? nameEn;
  final int? guestsCount;
  final String? descriptionAr;
  final String? descriptionEn;
  final double? minimumPrice;
  final double? minimumPriceAfterOffer;
  final bool? hasValidOffer;
  final bool? isFavorite;
  final double? averageRating;
  final int? currentOfferPercentage;
  final City? city;
  final Area? area;
  final FarmOwner? farmOwner;
  final List<ImageModel>? images;

  Farm({
    this.id,
    this.userId,
    this.cityId,
    this.nameAr,
    this.nameEn,
    this.guestsCount,
    this.descriptionAr,
    this.descriptionEn,
    this.minimumPrice,
    this.minimumPriceAfterOffer,
    this.hasValidOffer,
    this.isFavorite,
    this.averageRating,
    this.currentOfferPercentage,
    this.city,
    this.area,
    this.farmOwner,
    this.images,
  });

  factory Farm.fromJson(Map<String, dynamic> json) {
    return Farm(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      cityId: json['city_id'] as int?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      guestsCount: json['guests_count'] as int?,
      descriptionAr: json['description_ar'] as String?,
      descriptionEn: json['description_en'] as String?,
      minimumPrice: (json['minimum_price'] as num?)?.toDouble(),
      minimumPriceAfterOffer:
          (json['minimum_price_after_offer'] as num?)?.toDouble(),
      hasValidOffer: json['has_valid_offer'] as bool?,
      isFavorite: json['is_favorite'] as bool?,
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      currentOfferPercentage: json['current_offer_percentage'] as int?,
      city: json['city'] != null ? City.fromJson(json['city']) : null,
      area: json['area'] != null ? Area.fromJson(json['area']) : null,
      farmOwner: json['farm_owner'] != null
          ? FarmOwner.fromJson(json['farm_owner'])
          : null,
      images: (json['images'] as List?)
          ?.map((e) => ImageModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'city_id': cityId,
      'name_ar': nameAr,
      'name_en': nameEn,
      'guests_count': guestsCount,
      'description_ar': descriptionAr,
      'description_en': descriptionEn,
      'minimum_price': minimumPrice,
      'minimum_price_after_offer': minimumPriceAfterOffer,
      'has_valid_offer': hasValidOffer,
      'is_favorite': isFavorite,
      'average_rating': averageRating,
      'current_offer_percentage': currentOfferPercentage,
      'city': city?.toJson(),
      'area': area?.toJson(),
      'farm_owner': farmOwner?.toJson(),
      'images': images?.map((e) => e.toJson()).toList(),
    };
  }
}

class City {
  final int? id;
  final String? nameAr;
  final String? nameEn;

  City({this.id, this.nameAr, this.nameEn});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] as int?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': nameAr,
      'name_en': nameEn,
    };
  }
}

class Area {
  final int? id;
  final String? nameAr;
  final String? nameEn;

  Area({this.id, this.nameAr, this.nameEn});

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
      id: json['id'] as int?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': nameAr,
      'name_en': nameEn,
    };
  }
}

class FarmOwner {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? avatar;

  FarmOwner({this.id, this.name, this.phone, this.email, this.avatar});

  factory FarmOwner.fromJson(Map<String, dynamic> json) {
    return FarmOwner(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'avatar': avatar,
    };
  }
}

class ImageModel {
  final int? id;
  final String? imagePath;
  final bool? isMain;

  ImageModel({this.id, this.imagePath, this.isMain});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] as int?,
      imagePath: json['image_path'] as String?,
      isMain: json['is_main'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_path': imagePath,
      'is_main': isMain,
    };
  }
}

class Meta {
  final int? total;
  final int? count;
  final int? perPage;
  final int? currentPage;
  final int? totalPages;

  Meta(
      {this.total,
      this.count,
      this.perPage,
      this.currentPage,
      this.totalPages});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'] as int?,
      count: json['count'] as int?,
      perPage: json['per_page'] as int?,
      currentPage: json['current_page'] as int?,
      totalPages: json['total_pages'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'count': count,
      'per_page': perPage,
      'current_page': currentPage,
      'total_pages': totalPages,
    };
  }
}

class Links {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  Links({this.first, this.last, this.prev, this.next});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first': first,
      'last': last,
      'prev': prev,
      'next': next,
    };
  }
}
