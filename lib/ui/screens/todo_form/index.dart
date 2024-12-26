import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:softwars_todo/logic/models/todo.dart';
import 'package:softwars_todo/logic/provider/todo_list.dart';
import 'package:softwars_todo/logic/services/snackbar_service.dart';
import 'package:softwars_todo/ui/components/button.dart';
import 'package:softwars_todo/ui/components/error_message.dart';
import 'package:softwars_todo/ui/screens/todo_form/components/todo_header.dart';
import 'package:softwars_todo/ui/screens/todo_form/components/todo_datepicker.dart';
import 'package:softwars_todo/ui/screens/todo_form/components/todo_description.dart';
import 'package:softwars_todo/ui/screens/todo_form/components/todo_file.dart';
import 'package:softwars_todo/ui/screens/todo_form/components/todo_types.dart';
import 'package:softwars_todo/ui/screens/todo_form/components/todo_urgent.dart';
import 'package:uuid/uuid.dart';

enum TodoFormType {
  change,
  create,
}

class TodoFormArguments {
  late Todo? initialTodo;
  late TodoFormType formType;

  TodoFormArguments({
    this.initialTodo,
    required this.formType,
  });
}

class TodoFormScreen extends StatefulWidget {
  const TodoFormScreen({super.key});

  @override
  State<TodoFormScreen> createState() => _TodoFormScreenState();
}

class _TodoFormScreenState extends State<TodoFormScreen> {
  final Uuid uuid = const Uuid();

  bool _isInitialized = false;

  bool _showNameError = false;
  bool _showDateError = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  TodoFormType? _formType;
  String? _taskId;
  int _status = 1;

  int _type = 1;
  void _onChangedGroupValue(value) {
    setState(() {
      _type = value;
    });
  }

  Uint8List? _imageBytes;
  Future _pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    Uint8List imageBytes = await image.readAsBytes();

    setState(() {
      _imageBytes = imageBytes;
    });
  }

  DateTime? _date;
  void _onChangedDate(value) {
    setState(() {
      _date = value;
    });
  }

  int _isUrgent = 0;
  void _onChangeIsUrgent(value) {
    setState(() {
      _isUrgent = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_isInitialized) return; // Skip if already initialized

    final arguments =
        ModalRoute.of(context)?.settings.arguments as TodoFormArguments?;

    _formType = arguments?.formType;
    _taskId = arguments?.initialTodo?.taskId;
    _status = arguments?.initialTodo?.status ?? 1;
    _nameController.text = arguments?.initialTodo?.name ?? '';
    _descriptionController.text = arguments?.initialTodo?.description ?? '';
    _type = arguments?.initialTodo?.type ?? 1;
    _date = arguments?.initialTodo?.finishDate;
    _isUrgent = arguments?.initialTodo?.urgent ?? 0;

    if (arguments?.initialTodo?.file != null &&
        arguments!.initialTodo!.file!.isNotEmpty) {
      Uint8List bytes = base64Decode(arguments.initialTodo?.file as String);
      _imageBytes = bytes;
    }

    _isInitialized = true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TodoListProvider todoList = Provider.of<TodoListProvider>(context);
    final SnackbarService _snackbarService = SnackbarService();

    Future createTodo() async {
      if (_nameController.text.isEmpty || _date == null) {
        setState(() {
          _showNameError = _nameController.text.isEmpty;
          _showDateError = _date == null;
        });

        return;
      }

      setState(() {
        _showNameError = false;
        _showDateError = false;
      });

      final Todo todo = Todo(
        taskId: _taskId ?? uuid.v4(),
        status: _status,
        name: _nameController.text,
        type: _type,
        description: _descriptionController.text,
        file: _imageBytes != null ? base64Encode(_imageBytes!) : null,
        finishDate: _date!,
        urgent: _isUrgent,
      );

      await todoList.createTodo(todo);
      _snackbarService.showSnackbar(context, 'Таску успішно збережено');
      Navigator.pop(context);
    }

    Future deleteTodo() async {
      if (_taskId != null) {
        await todoList.deleteTodo(_taskId as String);
        _snackbarService.showSnackbar(context, 'Таску було видалено');
        Navigator.pop(context);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TodoHeader(
                  controller: _nameController,
                  showFaveIcon: _formType == TodoFormType.change,
                  onSave: createTodo,
                ),
                ErrorMessage(showErrorMessage: _showNameError),
                const SizedBox(height: 20),
                TodoTypes(
                  groupValue: _type,
                  onChanged: _onChangedGroupValue,
                ),
                const SizedBox(height: 8),
                TodoDescription(controller: _descriptionController),
                const SizedBox(height: 8),
                TodoFile(
                  file: _imageBytes,
                  onTap: _pickImageFromGallery,
                ),
                const SizedBox(height: 8),
                TodoDatepicker(
                  date: _date,
                  onChangeDate: _onChangedDate,
                ),
                ErrorMessage(showErrorMessage: _showDateError),
                const SizedBox(height: 8),
                TodoUrgent(
                  isUrgent: _isUrgent,
                  onChangeIsUrgent: _onChangeIsUrgent,
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Button(
                    title: _formType == TodoFormType.create
                        ? 'Створити'
                        : 'Видалити',
                    onPressed: _formType == TodoFormType.create
                        ? createTodo
                        : deleteTodo,
                    loading: todoList.loading,
                    type: _formType == TodoFormType.create
                        ? ButtonType.primary
                        : ButtonType.danger,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
