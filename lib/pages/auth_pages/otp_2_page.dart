import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:villagebanking/pages/profile_setup.dart';
import 'package:villagebanking/widgets/button.dart';

class OTP2Page extends StatefulWidget {
  final String? phone;
  const OTP2Page({Key? key, required this.phone}) : super(key: key);

  @override
  State<OTP2Page> createState() => _OTP2PageState();
}

class _OTP2PageState extends State<OTP2Page> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.only(
              left: 35,
              right: 35,
              bottom: 30,
            ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/18,),
                const Image(
                  image: AssetImage("assets/images/OTP_1.png"),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/13,),
                const Text("OTP Verification",
                style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/30,),
                Text("Enter the OTP sent to ${widget.phone}",
                style: const TextStyle(
                  fontSize: 19,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height/12,),
                Pinput(
                  length: 4,
                  keyboardType: TextInputType.number,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return '';
                    }
                    return null;
                  },
                  defaultPinTheme: const PinTheme(
                    width: 50,
                    height: 50,
                    textStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 245, 245, 1),
                      border: Border(
                          bottom: BorderSide(color: Color.fromRGBO(39, 67, 253, 1)),
                      )
                    )
                  ),
                  separator: SizedBox(width: MediaQuery.of(context).size.width/20,),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Didn't Receive OTP?",
                      style: TextStyle(
                          color: Color.fromRGBO(185, 185, 185, 1)
                      ),),
                    TextButton(
                        onPressed: () {},
                        child: const Text("Resend OTP",
                          style: TextStyle(
                              color: Color.fromRGBO(39, 67, 253, 1)
                          ),))
                  ],
                ),
                InkWell(
                    onTap: () {
                      FocusNode().unfocus();
                      if (_formKey.currentState!.validate()){
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileSetupPage(),
                          ),
                          ModalRoute.withName('welcome'),
                        );
                      }

                    },
                    child: const CustomButtonColor(title: "Verify")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
