import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:pixel_app/data/model/data_model.dart';

class HiveService {
// this funtion will add the all user datas to the hive database which means what are the datas are saving it will store to hive
  Future<void> addPanData(PanDatas panData) async {
    log("adding: $panData");
    Box<PanDatas> panDataBox = await Hive.openBox<PanDatas>('panDataBox');
    try {
      //adding the datas to hive using put method 
      await panDataBox.put(panData.dataId, panData);
      log('Data added successfully!');
    } catch (e) {
      log('Error adding data: $e');
    }
  }
  //from this funtion it will fetch the datas from the database which means hive
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
// deleting the user datas from hive based on the id when user is clicking 
//delete button at that time it will pass the user id and it will delete
  Future<void> deletePanData(String dataId) async {
    log("deleting data with ID: $dataId");
    Box<PanDatas> panDataBox = await Hive.openBox<PanDatas>('panDataBox');
    try {
      // in hive there is a method called delete called that funtion directly
      await panDataBox.delete(dataId);
      log('Data deleted successfully!');
    } catch (e) {
      log('Error deleting data: $e');
    }
  }
// this funtion will go to the database and it will edit the previios data which is user given newdatas it will store there
  Future<void> editPanData(String dataId, PanDatas newPanData) async {
    log("editing data with ID: $dataId");
    Box<PanDatas> panDataBox = await Hive.openBox<PanDatas>('panDataBox');
    try {
      await panDataBox.put(dataId, newPanData);
      log('Data edited successfully!');
    } catch (e) {
      log('Error editing data: $e');
    }
  }
}
