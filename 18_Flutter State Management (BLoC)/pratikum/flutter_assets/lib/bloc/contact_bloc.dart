import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_assets/data.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(const ContactState([])) {
    on<AddContactEvent>((event, emit) {
      final updatedContacts = List.of(state.contacts)..add(event.contactData);
      // membuat salinan state dengan properti contacts yg di update
      emit(state.copyWith(contacts: updatedContacts));
    });

    on<DeleteContactEvent>((event, emit) {
      final updatedContacts = List.of(state.contacts)..removeAt(event.index);
      emit(state.copyWith(contacts: updatedContacts));
    });

    on<EditContactEvent>((event, emit) {
      final updatedContacts = List.of(state.contacts);
      updatedContacts[event.index] = event.updatedData;
      emit(state.copyWith(contacts: updatedContacts));
    });
  }
}
