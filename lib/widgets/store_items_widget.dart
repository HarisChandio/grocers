
import 'package:flutter/material.dart';
import 'package:grocery_app/view_models/store_item_view_model.dart';

class StoreItemsWidget extends StatelessWidget {

  final List<StoreItemViewModel> storeItems; 
  final Function(StoreItemViewModel) onStoreItemDeleted; 

  StoreItemsWidget({this.storeItems, this.onStoreItemDeleted});

  Widget _buildItems(BuildContext context, int index) {

    final storeItem = storeItems[index];

    return Dismissible(
      key: Key(storeItem.storeItemId), 
      onDismissed: (_) {
        onStoreItemDeleted(storeItem);
      },
      background: Container(color: Colors.red),
      child: ListTile(
        title: Text(storeItem.name)
      )
    );

  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: storeItems.length,
      itemBuilder: _buildItems,
    );
    
  }
}