import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../utils/validators.dart';

class MemberFormScreen extends StatefulWidget {
  const MemberFormScreen({super.key});

  @override
  State<MemberFormScreen> createState() => _MemberFormScreenState();
}

class _MemberFormScreenState extends State<MemberFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _prnController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  String _selectedPosition = 'Member';
  String _selectedYear = 'FE';
  String _selectedDepartment = 'Computer Engineering';
  bool _isSubmitting = false;

  final List<String> _positions = [
    'Chairperson', 'Vice Chairperson', 'Secretary',
    'Treasurer', 'Member'
  ];

  final List<String> _years = ['FE', 'SE', 'TE', 'BE'];

  final List<String> _departments = [
    'Computer Engineering',
    'Information Technology',
    'Electronics & Telecommunication',
    'Mechanical Engineering',
    'Civil Engineering',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _prnController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);

      // Simulate saving
      Future.delayed(const Duration(seconds: 1), () {
        setState(() => _isSubmitting = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Member added successfully!'),
            backgroundColor: AppColors.success,
          ),
        );
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Member'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section header
              _SectionHeader(title: 'Personal Information'),
              const SizedBox(height: 12),

              // Name
              TextFormField(
                controller: _nameController,
                validator: Validators.validateName,
                decoration: const InputDecoration(
                  labelText: 'Full Name *',
                  hintText: 'Enter full name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(height: 16),

              // PRN
              TextFormField(
                controller: _prnController,
                validator: Validators.validatePRN,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: const InputDecoration(
                  labelText: 'PRN *',
                  hintText: '10-digit PRN number',
                  prefixIcon: Icon(Icons.badge_outlined),
                ),
              ),
              const SizedBox(height: 8),

              // Phone
              TextFormField(
                controller: _phoneController,
                validator: Validators.validatePhone,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: const InputDecoration(
                  labelText: 'Phone Number *',
                  hintText: '10-digit phone number',
                  prefixIcon: Icon(Icons.phone_outlined),
                ),
              ),
              const SizedBox(height: 8),

              // Email
              TextFormField(
                controller: _emailController,
                validator: Validators.validateEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email *',
                  hintText: 'yourname@vit.edu',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(height: 24),

              _SectionHeader(title: 'Club Details'),
              const SizedBox(height: 12),

              // Position dropdown
              DropdownButtonFormField<String>(
                value: _selectedPosition,
                validator: (v) => v == null ? 'Select a position' : null,
                decoration: const InputDecoration(
                  labelText: 'Position *',
                  prefixIcon: Icon(Icons.work_outline),
                ),
                items: _positions.map((p) =>
                    DropdownMenuItem(value: p, child: Text(p))
                ).toList(),
                onChanged: (v) => setState(() => _selectedPosition = v!),
              ),
              const SizedBox(height: 16),

              // Year and Department side by side
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedYear,
                      validator: (v) => v == null ? 'Required' : null,
                      decoration: const InputDecoration(
                        labelText: 'Year *',
                        prefixIcon: Icon(Icons.school_outlined),
                      ),
                      items: _years.map((y) =>
                          DropdownMenuItem(value: y, child: Text(y))
                      ).toList(),
                      onChanged: (v) => setState(() => _selectedYear = v!),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: _selectedDepartment,
                validator: (v) => v == null ? 'Select department' : null,
                decoration: const InputDecoration(
                  labelText: 'Department *',
                  prefixIcon: Icon(Icons.apartment_outlined),
                ),
                items: _departments.map((d) =>
                    DropdownMenuItem(value: d, child: Text(d))
                ).toList(),
                onChanged: (v) => setState(() => _selectedDepartment = v!),
              ),

              const SizedBox(height: 32),

              // Submit button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitForm,
                  child: _isSubmitting
                      ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                      : const Text(
                    'Add Member',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}