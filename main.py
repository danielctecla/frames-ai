from PyQt6 import QtCore, QtGui, QtWidgets
from PyQt6.QtWidgets import QInputDialog, QMessageBox, QLineEdit
from PyQt6.QtGui import QStandardItem, QStandardItemModel
from view import Ui_MainWindow

from pyswip import Prolog

import sys

class window(QtWidgets.QMainWindow):
    def __init__(self):
        super(window, self).__init__()
        self.ui = Ui_MainWindow()
        self.ui.setupUi(self)
        self.setFixedSize(self.size())
        
        self.getData()

        self.loadClasses()
        self.loadProperties()
        self.ui.class_listWidget.itemClicked.connect(self.on_item_clicked_Class)
        self.ui.properties_search.itemClicked.connect(self.on_item_clicked_Property)

    def getData(self):
        classes = list(prolog.query("clases(L)"))
        properties = list(prolog.query("todas_propiedades(L)"))
        if classes:
            self.class_names = [str(class_) for class_ in classes[0]['L']]
        if properties:
            self.property_names = [str(property_) for property_ in properties[0]['L']]

    def loadClasses(self):
        self.ui.class_listWidget.addItems(self.class_names)
        self.ui.class_listWidget.setCurrentRow(0)
    
    def loadProperties(self):
        self.ui.properties_search.addItems(self.property_names)
        self.ui.properties_search.setCurrentRow(0)
    
    def on_item_clicked_Class(self, item):
        class_name = item.text()
        self.setProperties(class_name)
        self.setClassDescription(class_name)
        self.setImage(class_name)

    def on_item_clicked_Property(self, item):
        properties_name = item.text()
        data = list(prolog.query(f"tiene_propiedad_sub({properties_name}, Objs)"))
        if data:
            objs = [str(obj) for obj in data[0]['Objs']]
        
        data = list(prolog.query(f"frames_con_propiedad({properties_name}, Frames)"))
        if data:
            frames = [str(frame) for frame in data[0]['Frames'] if str(frame) not in objs]

        model = QStandardItemModel()
        for obj in objs:
            item = QStandardItem(obj)
            model.appendRow(item)
        for frame in frames:
            item = QStandardItem(frame)
            model.appendRow(item)
        self.ui.listView.setModel(model)
    
    def setProperties(self, class_name):
        properties = list(prolog.query(f"propiedadesc({class_name}, L)"))
        if properties:
            property_list = [str(property_) for property_ in properties[0]['L']]
            model = QStandardItemModel()
            for property_ in property_list:
                item = QStandardItem(property_)
                model.appendRow(item)
            self.ui.properties_listView.setModel(model)
    
    def setClassDescription(self, class_name):
        description = list(prolog.query(f"obtiene_descripcion({class_name}, D)"))
        if description:
            self.ui.descritpion_text.setWordWrap(True)
            self.ui.descritpion_text.setText(description[0]['D'])

    def setImage(self, class_name):
        self.ui.image_show.setPixmap(QtGui.QPixmap(f"images/{class_name}.jpg"))    

def app():
    app = QtWidgets.QApplication(sys.argv)
    win = window()
    win.show()
    sys.exit(app.exec())


prolog = Prolog()
prolog.consult("prolog_data/knowledge.pl")
prolog.consult("prolog_data/engine.pl")

app()