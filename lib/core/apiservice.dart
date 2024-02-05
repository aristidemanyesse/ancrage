import 'package:ancrage/controllers/ConnexionController.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ApiService {
  // static const B31.207.34.30ASE_URL = "http://192.168.1.25:8000/";
  // static const BASE_URL = "http://10.10.10.33:8000/";
  static const BASE_URL = "https://admin.lancrage.com/";
  static const GRAPH_URL = "${BASE_URL}graphql/";
  static const MEDIA_URL = "${BASE_URL}media/";

  static Future<Map<String, dynamic>?> request(
      String query, Map<String, dynamic> variables) async {
    ConnexionController IController = Get.find();
    final HttpLink httpLink = HttpLink(GRAPH_URL);

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: variables,
    );

    if (IController.isConnected.value || true) {
      final QueryResult result = await client.query(options);
      if (result.hasException) {
        print("Erreur Apiservice::::: ${result.exception.toString()}");
        return null;
      }
      return result.data;
    }
    return null;
  }
}
