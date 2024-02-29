import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => RegisterFormProvider(),
        child: Builder(builder: (context) {
          final registerFormProvider =
              Provider.of<RegisterFormProvider>(context, listen: false);
          return Container(
            margin: const EdgeInsets.only(top: 100),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                  key: registerFormProvider.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          onChanged: (value) {
                            registerFormProvider.name = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'El nombre es obligatorio';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.always,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.buildInputDecoration(
                              hint: 'Ingrese su nombre',
                              label: 'Nombre',
                              icon: Icons.person)),
                      const SizedBox(height: 20),
                      //________________________________email
                      TextFormField(
                          onChanged: (value) {
                            registerFormProvider.email = value;
                          },
                          validator: (value) {
                            if (EmailValidator.validate(value ?? '')) {
                              return 'Email no válido';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.buildInputDecoration(
                              hint: 'Ingrese su correo',
                              label: 'Email',
                              icon: Icons.email_outlined)),
                      const SizedBox(height: 20),
                      //_________________________password
                      TextFormField(
                          onChanged: (value) {
                            registerFormProvider.password = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese su contraseña';
                            }
                            if (value.length < 6) {
                              return 'La contraseña debe de ser  más de 6 caracteres';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.buildInputDecoration(
                              hint: '******',
                              label: 'Contraseña',
                              icon: Icons.email_outlined)),
                      const SizedBox(height: 20),
                      CustomOutlinedButton(
                          onPressed: () {
                            registerFormProvider.validate();
                          },
                          text: 'Registrarse'),
                      const SizedBox(height: 10),

                      LinkText(
                        text: 'Ir al login',
                        onPressed: () {
                          Navigator.pushNamed(context, Flurorouter.loginRoute);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
