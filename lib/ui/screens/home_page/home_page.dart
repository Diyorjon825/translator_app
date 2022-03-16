import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate_application/ui/screens/home_page/home_page_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Translator'),
      ),
      body: const _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<HomePageViewModel>();
    final mq = MediaQuery.of(context);
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        children: [
          const SizedBox(height: 10),
          const _ConnectionStatus(),
          const Text(
            'Uzbek',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          const SizedBox(height: 10),
          Container(
            height: mq.size.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(color: Colors.grey, blurRadius: 10),
              ],
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Tarjima qilish uchun matn kiriting'),
              maxLength: null,
              maxLines: null,
              expands: true,
              onChanged: model.changeInput,
            ),
          ),
          const _ButtonWidget(),
          const _OutputTextWidget()
        ],
      ),
    );
  }
}

class _ConnectionStatus extends StatelessWidget {
  const _ConnectionStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomePageViewModel>();
    return (model.connectedToInternet == ConnectionStatus.connected)
        ? const SizedBox.shrink()
        : const Text(
            'NOT CONNECTION',
            style: TextStyle(color: Colors.red),
          );
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomePageViewModel>();
    final onPress = model.canSubmit ? model.translate : null;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPress,
          child: model.authInProgress
              ? const Center(child: CircularProgressIndicator.adaptive())
              : const Text(
                  'Ingliz tiliga tarjima qilish',
                ),
        ),
      ),
    );
  }
}

class _OutputTextWidget extends StatelessWidget {
  const _OutputTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomePageViewModel>();
    final mq = MediaQuery.of(context);
    return Container(
      height: mq.size.height * 0.34,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 10),
        ],
      ),
      child: Center(
        child: Text(model.output),
      ),
    );
  }
}
