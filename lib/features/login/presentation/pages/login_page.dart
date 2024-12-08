import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_styles.dart';
import '../../entities/user.dart';
import '../widgets/password_field/password_field.dart';
import '../widgets/user_tile.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // In a real app, these might be injected or retrieved via a repository.
  final List<User> _users = [
    User(id: '1', name: 'Krzysztof Kowalski', password: '111111'),
    User(id: '2', name: 'Jan Nowak', password: '111111'),
    User(id: '3', name: 'Anna Wiśniewska', password: '111111'),
    User(id: '4', name: 'Piotr Kamiński', password: '111111'),
    User(id: '5', name: 'Katarzyna Lewandowska', password: '111111'),
    User(id: '6', name: 'Tomasz Zieliński', password: '111111'),
    User(id: '7', name: 'Agnieszka Szymańska', password: '111111'),
    User(id: '8', name: 'Michał Woźniak', password: '111111'),
    User(id: '9', name: 'Ewa Kozłowska', password: '111111'),
    User(id: '10', name: 'Marcin Kwiatkowski', password: '111111'),
    User(id: '11', name: 'Krzysztof Kowalski', password: '111111'),
    User(id: '12', name: 'Jan Nowak', password: '111111'),
    User(id: '13', name: 'Anna Wiśniewska', password: '111111'),
    User(id: '14', name: 'Piotr Kamiński', password: '111111'),
    User(id: '15', name: 'Katarzyna Lewandowska', password: '111111'),
    User(id: '16', name: 'Tomasz Zieliński', password: '111111'),
    User(id: '17', name: 'Agnieszka Szymańska', password: '111111'),
    User(id: '18', name: 'Michał Woźniak', password: '111111'),
    User(id: '19', name: 'Ewa Kozłowska', password: '111111'),
    User(id: '20', name: 'Marcin Kwiatkowski', password: '111111'),
  ];

  User? _selectedUser;
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  void _onUserSelected(User user) {
    setState(() {
      _selectedUser = user;
    });
  }

  void _attemptLogin() {
    if (_selectedUser != null &&
        _passwordController.text == _selectedUser!.password) {
      Navigator.pushNamed(context, '/components');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.invalidCredentials)),
      );
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.loginTitle),
      ),
      body: Padding(
        padding: AppStyles.defaultPagePadding,
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: _users.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  final user = _users[index];
                  final isSelected = user == _selectedUser;
                  return UserTile(
                    user: user,
                    isSelected: isSelected,
                    onTap: () => _onUserSelected(user),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            PasswordField(
              controller: _passwordController,
              passwordVisible: _passwordVisible,
              onToggleVisibility: _togglePasswordVisibility,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _attemptLogin,
              child: const Text(AppStrings.loginButton),
            ),
          ],
        ),
      ),
    );
  }
}
