#!/bin/sh

PROJECT_DIR="/Users/michael/Development/Projects/clean_bootstrap"
MOD="lib/modules"
FEATURE_NAME="home"

#####
##  creates feature's base data, domain, presentation folders
##  also creates test folders
###

# mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME
# mkdir $PROJECT_DIR/test/$FEATURE_NAME
# touch $PROJECT_DIR/test/$FEATURE_NAME_test.dart

# mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/data/data_sources
# mkdir $PROJECT_DIR/test/$MOD/$FEATURE_NAME/data/data_sources

# mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/data/models
# mkdir $PROJECT_DIR/test/$MOD/$FEATURE_NAME/data/models
# mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/data/repositories
# mkdir $PROJECT_DIR/test/$MOD/$FEATURE_NAME/data/repositories

# mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/data/use_cases
# mkdir $PROJECT_DIR/test/$MOD/$FEATURE_NAME/data/use_cases

# mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/domain/entities
# mkdir $PROJECT_DIR/test/$MOD/$FEATURE_NAME/domain/entities
# mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/domain/repositories
# mkdir $PROJECT_DIR/test/$MOD/$FEATURE_NAME/domain/repositories
# mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/domain/use_cases
# mkdir $PROJECT_DIR/test/$MOD/$FEATURE_NAME/domain/use_cases

# mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/presentation
# mkdir $PROJECT_DIR/test/$MOD/$FEATURE_NAME/presentation
# mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/presentation/pages
# mkdir $PROJECT_DIR/test/$MOD/$FEATURE_NAME/presentation/pages
# mkdir $PROJECT_DIR/$MOD/$FEATURE_NAME/presentation/widgets
# mkdir $PROJECT_DIR/test/$MOD/$FEATURE_NAME/presentation/widgets


###
#   individual file creation
###

## creates a remote data source w/ test files
# touch $PROJECT_DIR/$MOD/$FEATURE_NAME/data/data_sources/$FEATURE_NAME_local_data_source.dart
# touch $PROJECT_DIR/test/$MOD/$FEATURE_NAME/data/data_sources/$FEATURE_NAME_local_data_source_test.dart

## creates a remote data source w/ test files
# touch $PROJECT_DIR/$MOD/$FEATURE_NAME/data/data_sources/$FEATURE_NAME_remote_data_source.dart
# touch $PROJECT_DIR/test/$MOD/$FEATURE_NAME/data/data_sources/$FEATURE_NAME_remote_data_source_test.dart

## creates a repo w/ test files
# touch $PROJECT_DIR/$MOD/$FEATURE_NAME/data/repositories/$FEATURE_NAME_repository_impl.dart
# touch $PROJECT_DIR/test/$MOD/$FEATURE_NAME/data/repositories/$FEATURE_NAME_repository_impl_test.dart
# touch $PROJECT_DIR/$MOD/$FEATURE_NAME/data/repositories/$FEATURE_NAME_repository.dart

###
#   setup dependency injection
###
# mkdir $PROJECT_DIR/lib/dependency_injection
# touch $PROJECT_DIR/lib/dependency_injection/dependency_injection.dart
# mkdir $PROJECT_DIR/test/dependency_injection
# touch $PROJECT_DIR/test/dependency_injection/dependency_injection_test.dart