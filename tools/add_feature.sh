#!/bin/sh

###
#   folder setup and file creation
###

PROJECT_DIR="/Users/michael/Development/Projects/cleanboot"
MOD="lib/src/features"
TEST="test/features"
FEATURE_NAME="app_init"

mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME
mkdir $PROJECT_DIR/$TEST
mkdir $PROJECT_DIR/$TEST/$FEATURE_NAME

## data section
mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/data
mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/data/data_sources
mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/data/repositories
mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/data/models
mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/data/use_cases
## data section test folders
mkdir $PROJECT_DIR/$TEST/$FEATURE_NAME/data
mkdir $PROJECT_DIR/$TEST/$FEATURE_NAME/data/data_sources
mkdir $PROJECT_DIR/$TEST/$FEATURE_NAME/data/repositories
mkdir $PROJECT_DIR/$TEST/$FEATURE_NAME/data/models
mkdir $PROJECT_DIR/$TEST/$FEATURE_NAME/data/use_cases

## domain section
mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/domain
mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/domain/entities
mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/domain/repositories
mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/domain/use_cases
## domain section test folders
mkdir $PROJECT_DIR/$TEST/$FEATURE_NAME/domain
mkdir $PROJECT_DIR/$TEST/$FEATURE_NAME/domain/entities
mkdir $PROJECT_DIR/$TEST/$FEATURE_NAME/domain/repositories
mkdir $PROJECT_DIR/$TEST/$FEATURE_NAME/domain/use_cases

## presentation section
mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/presentation
mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/presentation/pages
mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/presentation/widgets
## presentation section test folders
mkdir $PROJECT_DIR/$TEST/$FEATURE_NAME/presentation
mkdir $PROJECT_DIR/$TEST/$FEATURE_NAME/presentation/pages
mkdir $PROJECT_DIR/$TEST/$FEATURE_NAME/presentation/widgets

## creates a local data source w/ test files
touch $PROJECT_DIR/$MOD/$FEATURE_NAME/data/data_sources/"$FEATURE_NAME"_local_data_source.dart
touch $PROJECT_DIR/$TEST/$FEATURE_NAME/data/data_sources/"$FEATURE_NAME"_local_data_source_test.dart

## creates a remote data source w/ test files
touch $PROJECT_DIR/$MOD/$FEATURE_NAME/data/data_sources/"$FEATURE_NAME"_remote_data_source.dart
touch $PROJECT_DIR/$TEST/$FEATURE_NAME/data/data_sources/"$FEATURE_NAME"_remote_data_source_test.dart

## creates a repo w/ test files
touch $PROJECT_DIR/$MOD/$FEATURE_NAME/data/repositories/"$FEATURE_NAME"_repository_impl.dart
touch $PROJECT_DIR/$TEST/$FEATURE_NAME/data/repositories/"$FEATURE_NAME"_repository_impl_test.dart
touch $PROJECT_DIR/$MOD/$FEATURE_NAME/data/repositories/"$FEATURE_NAME"_repository.dart
touch $PROJECT_DIR/$TEST/$FEATURE_NAME/data/repositories/"$FEATURE_NAME"_repository_test.dart