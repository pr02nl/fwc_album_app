import 'package:flutter/widgets.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/helpers/messages.dart';
import 'package:fwc_album_app/app/pages/auth/register/register_page.dart';
import 'package:fwc_album_app/app/pages/auth/register/view/register_view.dart';

abstract class RegisterViewImpl extends State<RegisterPage>
    with Messages<RegisterPage>, Loader<RegisterPage>
    implements RegisterView {
  @override
  void initState() {
    super.initState();
    widget.registerPresenter.view = this;
  }

  @override
  void registerError([String? message]) {
    hideLoader();
    showError(message ?? "Erro ao registar usuário");
  }

  @override
  void registerSuccess() {
    hideLoader();
    showSucess("Usuário cadastrado com sucesso");
    Navigator.of(context).pop();
  }
}
