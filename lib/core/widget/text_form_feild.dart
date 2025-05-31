import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_athr/core/colors/color.dart';
import 'package:task_athr/core/utils/text_style.dart';


enum DecorationType { underlined, outlined, filled }

enum InputType { text, textAr, textEn, name, number, email, password, phone, url, price, search }

class AppTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? contentPadding;
  final DecorationType decorationType;
  final InputType inputType;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? borderSideColor;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final int? maxLines;

  const AppTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
    this.readOnly = false,
    this.contentPadding,
    this.inputTextStyle,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.icon,
    this.borderSideColor,
    this.inputFormatters,
    this.focusNode,
    this.inputType = InputType.text,
    this.decorationType = DecorationType.outlined,
    this.maxLines = 1,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final isPassword = widget.inputType == InputType.password;

    return TextFormField(
      maxLines:widget.maxLines,
      focusNode: widget.focusNode,
      keyboardType: _getKeyboardType(),
      inputFormatters: _getInputFormatters(),
      readOnly: widget.readOnly,
      controller: widget.controller,
      obscureText: isPassword ? _obscurePassword : false,
      style: widget.inputTextStyle ?? TextStyles.font14PrimarySemiBold,
      decoration: InputDecoration(
        icon: widget.icon,
        isDense: true,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        border: _buildInputBorder(),
        focusedBorder: _buildInputBorder(),
        enabledBorder: _buildInputBorder(),
        errorBorder: _buildInputBorder(),
        focusedErrorBorder: _buildInputBorder(),
        hintStyle: widget.hintStyle ?? TextStyles.font14PrimaryRegular,
        hintText: widget.hintText,
        fillColor: widget.backgroundColor ?? ColorManager.white,
        filled: widget.decorationType == DecorationType.filled,
        prefixIcon: widget.prefixIcon != null
            ? ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 24.h, maxWidth: 24.w),
                child: widget.prefixIcon!,
              )
            : null,
       suffixIcon: isPassword
    ? Container(
        margin: EdgeInsets.all(4),
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: const Color(0xFFEBEBEB),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: ColorManager.white,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
      )
    : widget.suffixIcon != null
        ? Container(
          margin: EdgeInsets.all(4),
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: const Color(0xFFEBEBEB),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Center(child: widget.suffixIcon),
          )
        : null,

      ),
      validator: widget.validator,
    );
  }

  InputBorder _buildInputBorder() {
    switch (widget.decorationType) {
      case DecorationType.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderSideColor ?? ColorManager.white,
            width: 1.3,
          ),
        );
      case DecorationType.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0.r),
          borderSide: BorderSide(
            color: widget.borderSideColor ?? ColorManager.white,
            width: 1.3,
          ),
        );
      case DecorationType.filled:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0.r),
          borderSide: BorderSide.none,
        );
    }
  }

  TextInputType _getKeyboardType() {
    switch (widget.inputType) {
      case InputType.number:
        return TextInputType.number;
      case InputType.email:
        return TextInputType.emailAddress;
      case InputType.password:
        return TextInputType.visiblePassword;
      case InputType.phone:
        return TextInputType.phone;
      case InputType.url:
        return TextInputType.url;
      case InputType.price:
        return const TextInputType.numberWithOptions(decimal: true);
      default:
        return TextInputType.text;
    }
  }

  List<TextInputFormatter>? _getInputFormatters() {
    switch (widget.inputType) {
      case InputType.number:
        return [FilteringTextInputFormatter.digitsOnly];
      case InputType.price:
        return [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))];
      case InputType.phone:
        return [FilteringTextInputFormatter.digitsOnly];
      default:
        return widget.inputFormatters;
    }
  }
}