part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class AddContactEvent extends ContactEvent {
  final Data contactData;

  const AddContactEvent(this.contactData);

  @override
  List<Object> get props => [contactData];
}

class EditContactEvent extends ContactEvent {
  final int index;
  final Data updatedData;

  const EditContactEvent(this.index, this.updatedData);

  @override
  List<Object> get props => [index, updatedData];
}

class DeleteContactEvent extends ContactEvent {
  final int index;

  const DeleteContactEvent(this.index);

  @override
  List<Object> get props => [index];
}