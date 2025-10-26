class FarmDetailsModel {
  final bool success;
  final FarmDet? results;
  final String error;

  FarmDetailsModel({
    required this.success,
    required this.results,
    required this.error,
  });

  factory FarmDetailsModel.fromJson(Map<String, dynamic> json) {
    return FarmDetailsModel(
      success: json['success'] as bool,
      results:
          json['results'] != null ? FarmDet.fromJson(json['results']) : null,
      error: json['error'] ?? '',
    );
  }
}

class FarmDet {
  final int id;
  final int userId;
  final int cityId;
  final int areaId;
  final String nameAr;
  final String nameEn;
  final String descriptionAr;
  final String descriptionEn;
  final int guestsCount;
  final String depositRate;
  final String status;
  final double? latitude;
  final double? longitude;
  final String? coordinates;
  final bool hasCoordinates;
  final double minimumPrice;
  final double minimumPriceAfterOffer;
  final bool hasValidOffer;
  final bool isFavorite;
  final int totalRatings;
  final double averageRating;
  final int currentOfferPercentage;
  final String createdAt;
  final String updatedAt;
  final NotAvailableDates? notavailabledates;
  final FormattedNotAvailableDate? formattednotavailableDate;
  final List<AvailablePriceType>? availablepricetype;
  final RatingUser? ratinguser;
  final City? city;
  final Area? area;
  final FarmOwner? farmowner;
  final List<Feature>? feature;
  final List<ImageModel>? images;

  FarmDet({
    required this.id,
    required this.userId,
    required this.cityId,
    required this.areaId,
    required this.nameAr,
    required this.nameEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.guestsCount,
    required this.depositRate,
    required this.status,
    this.latitude,
    this.longitude,
    this.coordinates,
    required this.hasCoordinates,
    required this.minimumPrice,
    required this.minimumPriceAfterOffer,
    required this.hasValidOffer,
    required this.isFavorite,
    required this.totalRatings,
    required this.averageRating,
    required this.currentOfferPercentage,
    required this.createdAt,
    required this.updatedAt,
    this.notavailabledates,
    this.formattednotavailableDate,
    this.availablepricetype,
    this.ratinguser,
    this.city,
    this.area,
    this.farmowner,
    this.feature,
    this.images,
  });

  factory FarmDet.fromJson(Map<String, dynamic> json) {
    return FarmDet(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      cityId: json['city_id'] ?? 0,
      areaId: json['area_id'] ?? 0,
      nameAr: json['name_ar'] ?? '',
      nameEn: json['name_en'] ?? '',
      descriptionAr: json['description_ar'] ?? '',
      descriptionEn: json['description_en'] ?? '',
      guestsCount: json['guests_count'] ?? 0,
      depositRate: json['deposit_rate'] ?? '',
      status: json['status'] ?? '',
      latitude: json['latitude'] != null
          ? double.tryParse(json['latitude'].toString())
          : null,
      longitude: json['longitude'] != null
          ? double.tryParse(json['longitude'].toString())
          : null,
      coordinates: json['coordinates'],
      hasCoordinates: json['has_coordinates'] ?? false,
      minimumPrice: (json['minimum_price'] ?? 0).toDouble(),
      minimumPriceAfterOffer:
          (json['minimum_price_after_offer'] ?? 0).toDouble(),
      hasValidOffer: json['has_valid_offer'] ?? false,
      isFavorite: json['is_favorite'] ?? false,
      totalRatings: json['total_ratings'] ?? 0,
      averageRating: double.tryParse(json['average_rating'].toString()) ?? 0.0,
      currentOfferPercentage: json['current_offer_percentage'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      notavailabledates: json['notavailabledates'] != null
          ? NotAvailableDates.fromJson(json['notavailabledates'])
          : null,
      availablepricetype: (json['available_price_types'] as List?)
          ?.map((e) => AvailablePriceType.fromJson(e))
          .toList(),
      formattednotavailableDate: json['formattednotavailableDate'] != null
          ? FormattedNotAvailableDate.fromJson(
              json['formattednotavailableDate'])
          : null,
      ratinguser: json['ratinguser'] != null
          ? RatingUser.fromJson(json['ratinguser'])
          : null,
      images: (json['images'] as List?)
          ?.map((e) => ImageModel.fromJson(e))
          .toList(),
      city: json['city'] != null ? City.fromJson(json['city']) : null,
      area: json['area'] != null ? Area.fromJson(json['area']) : null,
      feature:
          (json['features'] as List?)?.map((e) => Feature.fromJson(e)).toList(),
      farmowner: json['farm_owner'] != null
          ? FarmOwner.fromJson(json['farm_owner'])
          : null,
    );
  }
}

class NotAvailableDates {
  final List<String> dayUse;
  final List<String> night;
  final List<String> fullDay;

  NotAvailableDates({
    required this.dayUse,
    required this.night,
    required this.fullDay,
  });

  factory NotAvailableDates.fromJson(Map<String, dynamic> json) {
    return NotAvailableDates(
      dayUse: json['day_use'] != null ? List<String>.from(json['day_use']) : [],
      night: json['night'] != null ? List<String>.from(json['night']) : [],
      fullDay:
          json['full_day'] != null ? List<String>.from(json['full_day']) : [],
    );
  }
}

class FormattedNotAvailableDate {
  final String date;
  final String formatted;
  final String humanReadable;
  final List<String> priceTypes;

  FormattedNotAvailableDate({
    required this.date,
    required this.formatted,
    required this.humanReadable,
    required this.priceTypes,
  });

  factory FormattedNotAvailableDate.fromJson(Map<String, dynamic> json) {
    return FormattedNotAvailableDate(
      date: json['date'] ?? '',
      formatted: json['formatted'] ?? '',
      humanReadable: json['human_readable'] ?? '',
      priceTypes: json['price_types'] != null
          ? List<String>.from(json['price_types'])
          : [],
    );
  }
}

class AvailablePriceType {
  final String type;
  final String nameAr;
  final String nameEn;
  final String startTime;
  final String endTime;
  final String timeRange;
  final int durationHours;
  final double minPrice;

  AvailablePriceType({
    required this.type,
    required this.nameAr,
    required this.nameEn,
    required this.startTime,
    required this.endTime,
    required this.timeRange,
    required this.durationHours,
    required this.minPrice,
  });

  factory AvailablePriceType.fromJson(Map<String, dynamic> json) {
    return AvailablePriceType(
      type: json['type'] ?? '',
      nameAr: json['name_ar'] ?? '',
      nameEn: json['name_en'] ?? '',
      startTime: json['start_time'] ?? '',
      endTime: json['end_time'] ?? '',
      timeRange: json['time_range'] ?? '',
      durationHours: json['duration_hours'] ?? 0,
      minPrice: json['min_price'] != null
          ? double.tryParse(json['min_price'].toString()) ?? 0.0
          : 0.0,
    );
  }
}

class RatingUser {
  final int id;
  final String name;
  final String avatar;

  RatingUser({
    required this.id,
    required this.name,
    required this.avatar,
  });

  factory RatingUser.fromJson(Map<String, dynamic> json) {
    return RatingUser(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }
}

class City {
  final int id;
  final String nameAr;
  final String nameEn;
  final double? latitude;
  final double? longitude;
  final String? coordinates;
  final bool hasCoordinates;

  City({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    this.latitude,
    this.longitude,
    this.coordinates,
    required this.hasCoordinates,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] ?? 0,
      nameAr: json['name_ar'] ?? '',
      nameEn: json['name_en'] ?? '',
      latitude: json['latitude'] != null
          ? double.tryParse(json['latitude'].toString())
          : null,
      longitude: json['longitude'] != null
          ? double.tryParse(json['longitude'].toString())
          : null,
      coordinates: json['coordinates'],
      hasCoordinates: json['has_coordinates'] ?? false,
    );
  }
}

class Area {
  final int id;
  final String nameAr;
  final String nameEn;
  final double? latitude;
  final double? longitude;
  final String? coordinates;
  final bool hasCoordinates;

  Area({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    this.latitude,
    this.longitude,
    this.coordinates,
    required this.hasCoordinates,
  });

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
      id: json['id'] ?? 0,
      nameAr: json['name_ar'] ?? '',
      nameEn: json['name_en'] ?? '',
      latitude: json['latitude'] != null
          ? double.tryParse(json['latitude'].toString())
          : null,
      longitude: json['longitude'] != null
          ? double.tryParse(json['longitude'].toString())
          : null,
      coordinates: json['coordinates'],
      hasCoordinates: json['has_coordinates'] ?? false,
    );
  }
}

class FarmOwner {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String avatar;

  FarmOwner({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.avatar,
  });

  factory FarmOwner.fromJson(Map<String, dynamic> json) {
    return FarmOwner(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }
}

class Feature {
  final int id;
  final String nameAr;
  final String nameEn;
  final String icon;

  Feature({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.icon,
  });

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      id: json['id'],
      nameAr: json['name_ar'] ?? '',
      nameEn: json['name_en'] ?? '',
      icon: json['icon'] ?? '',
    );
  }
}

class ImageModel {
  final int id;
  final String imagePath;
  final bool isMain;

  ImageModel({
    required this.id,
    required this.imagePath,
    required this.isMain,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      imagePath: json['image_path'] ?? '',
      isMain: json['is_main'] ?? false,
    );
  }
}
