import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:pixel_app/data/model/data_model.dart';

class HiveService {
  Future<void> addPanData(PanDatas panData) async {
    log("adding: $panData");
    Box<PanDatas> panDataBox = await Hive.openBox<PanDatas>('panDataBox');
    try {
      await panDataBox.put(panData.dataId, panData);
      log('Data added successfully!');
    } catch (e) {
      log('Error adding data: $e');
    }
  }

  Future<List<PanDatas>> getPanData() async {
    Box<PanDatas> panDataBox = await Hive.openBox<PanDatas>('panDataBox');
    try {
      // Get all the values from the box and convert them to a list
      List<PanDatas> panDataList = panDataBox.values.toList();
      return panDataList;
    } catch (e) {
      log('Error retrieving data: $e');
      return [];
    }
  }

  Future<void> deletePanData(String dataId) async {
    log("deleting data with ID: $dataId");
    Box<PanDatas> panDataBox = await Hive.openBox<PanDatas>('panDataBox');
    try {
      await panDataBox.delete(dataId);
      log('Data deleted successfully!');
    } catch (e) {
      log('Error deleting data: $e');
    }
  }
}
