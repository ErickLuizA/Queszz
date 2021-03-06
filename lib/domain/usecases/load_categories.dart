import 'package:Queszz/domain/entities/category.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class LoadCategories {
  Future<Either<Failure, List<Category>>> load(Locale locale);
}
