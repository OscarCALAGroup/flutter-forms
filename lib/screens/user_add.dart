import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_flutter/models/Groups/groups.dart';
import 'package:form_flutter/models/Users/users.dart';
import 'package:form_flutter/providers/groups_provider.dart';
import 'package:form_flutter/widgets/inputs/custom_dropdown_form_field.dart';
import 'package:form_flutter/widgets/inputs/custom_text_form_field.dart';

class AddUser extends ConsumerWidget {
  const AddUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adduser'),
      ),
      body: const _AddUser(),
    );
  }
}

class _AddUser extends ConsumerWidget {
  const _AddUser();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupsAsync = ref.watch(groupsProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: groupsAsync.when(
              data: (value) {
                List<String> items = [];
                for (Groups e in value) {
                  items.add(e.groupName);
                }
                return _AddUserForm(items, value);
              },
              error: (error, stackTrace) => Text('$error'),
              loading: () => const Center(child: CircularProgressIndicator())),
        ),
      ),
    );
  }
}

class _AddUserForm extends StatefulWidget {
  final List<String>? groups;
  final List<Groups>? apiGroups;
  const _AddUserForm(this.groups, this.apiGroups);

  @override
  State<_AddUserForm> createState() => __AddUserFormState();
}

class __AddUserFormState extends State<_AddUserForm> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    Users user = Users(
      user_id: 0,
      user_name: '',
      user_email: '',
      password: '123456',
      user_phone: '',
      user_status: false,
      group_id: null,
    );
    return Form(
        key: formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 20),
            CustomTextFormField(
                label: 'Nombre',
                initialValue: user.user_name,
                onChanged: (value) {
                  user.user_name = value;
                },
                validator: (value) {
                  if (value == '') return "Este campo es obligatorio";
                  return null;
                }),
            const SizedBox(height: 20),
            CustomTextFormField(
                label: 'Correo electronico',
                initialValue: user.user_email,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => user.user_email = value,
                validator: (value) {
                  if (value == '') return "Este campo es obligatorio";
                  return null;
                }),
            const SizedBox(height: 20),
            CustomTextFormField(
                label: 'Telefono',
                initialValue: user.user_phone,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  user.user_phone = value;
                },
                validator: (value) {
                  if (value == '') return "Este campo es obligatorio";
                  return null;
                }),
            const SizedBox(height: 20),
            CustomDropdownFormField<Groups>(
              label: "Grupo",
              items: widget.groups,
              onChanged: (value) {
                final group = widget.apiGroups!
                    .firstWhere((element) => element.groupName == value);
                user.group_id = group.groupId;
              },
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                SystemChannels.textInput.invokeMethod('TextInput.hide');

                final isValid = formkey.currentState!.validate();
                if (!isValid) return;
              },
              child: const Icon(Icons.check, size: 30),
            ),
          ],
        ));
  }
}
