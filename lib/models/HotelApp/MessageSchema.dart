import 'package:ancrage/models/HotelApp/Message.dart';

class MessageSchema {
  static const String ALL = r"""
    query () {
      searchMessage(
        deleted: false
      ) {
        results {
          ...MessageFragment
        }
      }
    }
  """ +
      Message.MessageFragment;

  static const String CREATE = r"""
    mutation ($fullname : String!, $contact : String!, $sujet : String!, $message : String!){
      createMessage(newMessage : {
          fullname : $fullname,
          contact : $contact,
          sujet: $sujet,
          message: $message,
        }){
          ok
          errors{
            field
            messages
          }
          message{
            ...MessageFragment
          }
        }
      }
  """ +
      Message.MessageFragment;
}
