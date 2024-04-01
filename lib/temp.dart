import 'package:cloud_functions/cloud_functions.dart';

import 'package:cloud_functions/cloud_functions.dart';

class FunctionResultStruct {
  final bool? actionSuccessful;
  final String? errorMessage;

  FunctionResultStruct(
      {required this.actionSuccessful, required this.errorMessage});
}

Future<FunctionResultStruct> _invokeFunction(
    String functionName, Map<String, dynamic> inputData) async {
  HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
    functionName,
    options: HttpsCallableOptions(
      timeout: const Duration(seconds: 60),
    ),
  );
  try {
    final errorMessage = (await callable(inputData)).data;
    if (errorMessage != null) {
      return FunctionResultStruct(
          actionSuccessful: false, errorMessage: errorMessage.toString());
    }
    return FunctionResultStruct(actionSuccessful: true, errorMessage: null);
  } catch (e) {
    return FunctionResultStruct(
        actionSuccessful: false, errorMessage: e.toString());
  }
}

Future<FunctionResultStruct> applyPromoCode(String code) async {
  // Add your function code here!
  return await _invokeFunction('applyPromoCode', {"code": code});
}

Future<FunctionResultStruct> addReferrer(String refCode) async {
  // Add your function code here!
  return _invokeFunction('addReferrer', {"refCode": refCode});
}

Future<FunctionResultStruct> buySubscription(int tierId) async {
  // Add your function code here!
  return _invokeFunction('buySubscription', {"tierId": tierId});
}

Future<FunctionResultStruct> cancelChallenge(String challengeId) async {
  // Add your function code here!
  return _invokeFunction('cancelChallenge', {"challengeId": challengeId});
}

Future<FunctionResultStruct> createNewChallenge(
  List<String> playerIds,
  String gameId,
  String? teamName,
) async {
  // Add your function code here!
  return _invokeFunction("createNewChallenge", {
    "playerIds": playerIds,
    "gameId": gameId,
    "teamName": teamName,
  });
}

Future<FunctionResultStruct> joinChallenge(
  List<String> playerIds,
  String gameId,
  String? teamName,
) async {
  // Add your function code here!
  return _invokeFunction("joinChallenge", {
    "playerIds": playerIds,
    "gameId": gameId,
    "teamName": teamName,
  });
}

Future<FunctionResultStruct> resolveDispute(
     String disputeId,
     int winner,
     String? comment
) async {
  // Add your function code here!
  return _invokeFunction("resolveDispute", {
    "disputeId": disputeId,
    "winner": winner,
    "comment": comment,
  });
}
