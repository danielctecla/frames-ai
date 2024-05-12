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
        self.getData()

        self.setFixedSize(self.size())

        self.loadClasses()
        self.ui.class_listWidget.itemClicked.connect(self.on_item_clicked)

    def getData(self):
        classes = list(prolog.query("clases(L)"))
        if classes:
            self.class_names = [str(class_) for class_ in classes[0]['L']]

    def loadClasses(self):
        self.ui.class_listWidget.addItems(self.class_names)
        self.ui.class_listWidget.setCurrentRow(0)
    
    def on_item_clicked(self, item):
        class_name = item.text()
        self.setProperties(class_name)
        self.setClassDescription(class_name)
    
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
            self.ui.descritpion_text.setText(description[0]['D'])


def app():
    app = QtWidgets.QApplication(sys.argv)
    win = window()
    win.show()
    sys.exit(app.exec())


prolog = Prolog()
prolog.consult("prolog_data/knowledge.pl")
prolog.consult("prolog_data/engine.pl")

app()