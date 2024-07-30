import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:pixel_app/data/model/data_model.dart';

class HiveService {
  Future<void> addPanData(PanDatas panData) async {
    log("adding: $panData");
    Box<PanDatas> panDataBox = await Hive.openBox<PanDatas>('panDataBox');
    try {
      await panDataBox.put(panData.dataId, panData);
      print('Data added successfully!');
    } catch (e) {
      print('Error adding data: $e');
    }
  }

  Future<List<PanDatas>> getPanData() async {
    Box<PanDatas> panDataBox = await Hive.openBox<PanDatas>('panDataBox');
    try {
      // Get all the values from the box and convert them to a list
      List<PanDatas> panDataList = panDataBox.values.toList();

      // Optional: Print the list to verify the data
      print(panDataList);

      return panDataList;
    } catch (e) {
      print('Error retrieving data: $e');
      return [];
    }
  }
}
