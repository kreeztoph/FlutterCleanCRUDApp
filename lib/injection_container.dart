import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:firebasecrud/core/network/network_info.dart';
import 'package:firebasecrud/features/crudapp/CRUD/data/datasources/user_remote_data_source.dart';
import 'package:firebasecrud/features/crudapp/CRUD/data/repository/user_repo_impl.dart';
import 'package:firebasecrud/features/crudapp/CRUD/domain/repository/user_repository.dart';
import 'package:firebasecrud/features/crudapp/CRUD/domain/usecases/create_user.dart';
import 'package:firebasecrud/features/crudapp/CRUD/domain/usecases/delete_user.dart';
import 'package:firebasecrud/features/crudapp/CRUD/domain/usecases/edit_user.dart';
import 'package:firebasecrud/features/crudapp/CRUD/domain/usecases/listen_user.dart';
import 'package:firebasecrud/features/crudapp/CRUD/presentation/cubit/create_user_cubit/user_cubit.dart';
import 'package:firebasecrud/features/crudapp/CRUD/presentation/cubit/edit_user_cubit/edit_user_cubit_cubit.dart';
import 'package:firebasecrud/features/crudapp/CRUD/presentation/cubit/fetch_users_cubit/fetch_users_cubit.dart';
import 'package:firebasecrud/features/crudapp/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:firebasecrud/features/crudapp/authentication/data/repository/auth_repo_impl.dart';
import 'package:firebasecrud/features/crudapp/authentication/domain/repository/emailPassword_repository.dart';
import 'package:firebasecrud/features/crudapp/authentication/domain/usecases/create_new_user.dart';
import 'package:firebasecrud/features/crudapp/authentication/domain/usecases/login_user.dart';
import 'package:firebasecrud/features/crudapp/authentication/domain/usecases/register_user.dart';
import 'package:firebasecrud/features/crudapp/authentication/presentation/cubit/Log_in_cubit/login_cubit.dart';
import 'package:firebasecrud/features/crudapp/authentication/presentation/cubit/sign_up_cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - User
  sl.registerFactory(
    () => UserCubit(
      createUser: sl(),
    ),
  );
  sl.registerFactory(() => EditUserCubit(
        editUser: sl(),
        listUser: sl(),
      ));
  sl.registerFactory(() => FetchUsersCubit(
        listUser: sl(),
        deleteUser: sl(),
        editUser: sl(),
      ));

  sl.registerFactory(
    () => SignupCubit(registerNewUser: sl()),
  );

  sl.registerFactory(() => LoginCubit(loginUser: sl()));
  //Usecases
  sl.registerLazySingleton(
    () => CreateUser(sl()),
  );
  sl.registerLazySingleton(
    () => ListUser(sl()),
  );
  sl.registerLazySingleton(
    () => DeleteUser(sl()),
  );
  sl.registerLazySingleton(
    () => EditUser(sl()),
  );
  sl.registerLazySingleton(
    () => RegisterNewUser(sl()),
  );
  sl.registerLazySingleton(
    () => LoginUser(sl()),
  );
  sl.registerLazySingleton(
    () => CreateNewUser(sl()),
  );

  //repository
  sl.registerLazySingleton<UserRepository>(() => UserRepoImpl(
        userRemoteDataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<EmailPasswordRepository>(() => EmailPasswordRepoImpl(
        authRemoteDataSource: sl(),
        networkInfo: sl(),
      ));

  //Data Sources
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(
      firebaseFirestore: sl(),
    ),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkConnectionImpl(
      sl(),
    ),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
        firebaseFirestore: sl(),
        firebaseAuth: sl(),
      ));

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => FirebaseAuth.instance);
}
