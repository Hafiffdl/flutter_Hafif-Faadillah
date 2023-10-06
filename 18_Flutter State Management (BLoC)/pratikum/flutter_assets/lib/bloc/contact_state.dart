part of 'contact_bloc.dart';

class ContactState extends Equatable {
  final List<Data> contacts;

  const ContactState(this.contacts);

  @override
  List<Object> get props => [contacts];

  ContactState copyWith({
    List<Data>? contacts,
  }) {
    return ContactState(
      contacts ?? this.contacts,
    );
  }
}
