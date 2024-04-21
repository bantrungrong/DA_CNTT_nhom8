import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getxapp/app/core/values/colors.dart';
import 'package:getxapp/app/core/values/strings.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool isSearching = false;
  List<String> userName = [
    'Cocacola',
    'Sting',
    'Nước lọc',
    'Trà sữa',
    'trà đá',
    'Pessi',
    'Nước suối',
    'Samurai',
    'Nước giải khát',
    'La hán quả',
  ];
  List<String> company = [
    'Công ty cổ phần nước giải khát x',
    'Công ty cổ phần nước giải khát y',
    'Công ty cổ phần nước giải khát z',
    'Công ty cổ phần nước giải khát a',
    'Công ty cổ phần nước giải khát b',
    'Công ty cổ phần nước giải khát b',
    'Công ty cổ phần nước giải khát c',
    'Công ty cổ phần nước giải khát f',
    'Công ty cổ phần nước giải khát g',
    'Công ty cổ phần nước giải khát h',
  ];
  List<String> items = [
    'Ngày 12 tháng 1 năm 2022',
    'Ngày 1 tháng 1 năm 2021',
    'Ngày 22 tháng 1 năm 2024',
    'Ngày 31 tháng 1 năm 2023',
    'Ngày 24 tháng 1 năm 2020',
    'Ngày 24 tháng 1 năm 2019',
    'Ngày 1 tháng 1 năm 2009',
    'Ngày 2 tháng 1 năm 2008',
    'Ngày 6 tháng 1 năm 2007',
    'Ngày 8 tháng 1 năm 2001',
  ];
  // bool checkStatus = false;
  List<String> filteredUserName = [];
  final TextEditingController _textController = TextEditingController();
  void _searchUsers(String query) {
    filteredUserName.clear();
    if (query.isNotEmpty) {
      setState(() {
        filteredUserName.addAll(
          userName.where(
              (name) => name.toLowerCase().contains(query.toLowerCase())),
        );
      });
    }
  }

//
  void addProduct(String newName, String newCompany) {
    setState(() {
      userName.add(newName);
      company.add(newCompany);
    });
  }

  void deleteProduct(int index) {
    setState(() {
      userName.removeAt(index);
      company.removeAt(index);
    });
  }

  void editProduct(int index, String updatedName, String updatedCompany) {
    setState(() {
      userName[index] = updatedName;
      company[index] = updatedCompany;
    });
  }

  List<bool> isProcces = List.generate(10, (index) => true);
  void toggleProductStatus(int index) {
    setState(() {
      isProcces[index] = !isProcces[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100 - 44,
        backgroundColor: AppColors.primary,
        title: isSearching == false ? _buildAppBar() : _buildTextField(),
      ),
      body: _buildBodyContext(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String newName = '';
              String newCompany = '';
              return AlertDialog(
                title: const Text('Add Product'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (value) {
                        newName = value;
                      },
                      decoration:
                          const InputDecoration(labelText: 'Product Name'),
                    ),
                    TextField(
                      onChanged: (value) {
                        newCompany = value;
                      },
                      decoration: const InputDecoration(labelText: 'Company'),
                    ),
                    DropdownButtonFormField<bool>(
                      value: true, // Default value for the product status
                      items: const [
                        DropdownMenuItem<bool>(
                          value: true,
                          child: Text('Còn sản xuất'),
                        ),
                        DropdownMenuItem<bool>(
                          value: false,
                          child: Text('Không còn sản xuất'),
                        ),
                      ],
                      onChanged: (value) {
                        // Update the status when the dropdown value changes
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      addProduct(newName, newCompany);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBodyContext() {
    return SingleChildScrollView(
      child: Column(
          children: List.generate(
              isSearching ? filteredUserName.length : userName.length,
              (index) => GestureDetector(
                  onTap: () {},
                  child: _widgetUser(
                      '',
                      isSearching ? filteredUserName[index] : userName[index],
                      company[index],
                      index % 2 == 0 ? false : true,
                      1)))),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              padding: const EdgeInsets.only(left: 7),
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: AppColors.primary,
              )),
        ),
        Text(
          'Quản lý danh mục sản phẩm',
          style: AppStyle.bold(color: Colors.white, fontSize: 16),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isSearching = !isSearching;
            });
          },
          child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white),
              child: const Icon(
                Icons.search_outlined,
                color: AppColors.primary,
                size: 20,
              )),
        ),
      ],
    );
  }

  Widget _buildTextField() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Colors.white,
          ),
        ),
        const Gap(8),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 46,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: TextFormField(
            controller: _textController,
            readOnly: false,
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              border: InputBorder.none,
              filled: true,
              errorStyle: TextStyle(height: 0),
              hintText: 'Tìm kiếm ...',
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.primary,
              ),
              contentPadding: EdgeInsets.all(12),
            ),
            onChanged: (value) async {
              _searchUsers(value);
            },
          ),
        )
      ],
    );
  }

  Widget _widgetUser(
    String assetsname,
    String name,
    String cell,
    bool isProcces,
    int index, // Add index parameter to identify the product
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 2), // changes the direction of shadow
          ),
        ],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(image: AssetImage(assetsname))),
        ),
        const Gap(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tên sản phẩm: $name',
              style: AppStyle.medium(fontSize: 14)
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Text(
                  'Trạng thái:',
                  style: AppStyle.regular(fontSize: 13),
                ),
                TextButton(
                  onPressed: () {
                    toggleProductStatus(index);
                  },
                  child: Text(
                    isProcces ? 'Còn sản xuất' : 'Không còn sản xuất',
                    style: AppStyle.regular(
                        fontSize: 13,
                        color: isProcces ? Colors.green : Colors.red),
                  ),
                ),
              ],
            ),
            Text(
              cell,
              style: AppStyle.regular(fontSize: 13),
            ),
          ],
        )
      ]),
    );
  }
}
