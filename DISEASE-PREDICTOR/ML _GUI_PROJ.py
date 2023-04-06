from PyQt5.QtWidgets import *
from PyQt5.QtGui import QFont
import sys
from PyQt5.QtWidgets import QApplication, QWidget, QComboBox

def main():
    app = QApplication([]) # Manages the GUI application's control flow and main settings
    window = QWidget()

    window.setGeometry(100 , 100 , 400 , 300)
    window.setWindowTitle("Disease Predictor")


    layout = QVBoxLayout()


    label = QLabel("Select your symptoms:")
    symptom1 = QComboBox()
    symptom1.addItems(["Fever", "Cough", "Fatigue", "Headache"])
    symptom2 = QComboBox()
    symptom2.addItems(["Nausea", "Diarrhea", "Vomiting", "Abdominal Pain"])
    symptom3 = QComboBox()
    symptom3.addItems(["Shortness of Breath", "Chest Pain", "Sore Throat", "Loss of Smell or Taste"])
    symptom4 = QComboBox()
    symptom4.addItems(["Muscle Aches", "Joint Pain", "Rash", "Swollen Glands"])
    button = QPushButton("Predict Disease")


    button.clicked.connect(lambda: on_clicked(symptom1.currentText(), symptom2.currentText(), symptom3.currentText(), symptom4.currentText()))


    layout.addWidget(label)
    layout.addWidget(symptom1)
    layout.addWidget(symptom2)
    layout.addWidget(symptom3)
    layout.addWidget(symptom4)
    layout.addWidget(button)


    window.setLayout(layout)

    window.show()
    app.exec_()



def on_clicked(symptom1, symptom2, symptom3, symptom4):
    print("Symptoms selected: {}, {}, {}, {}".format(symptom1, symptom2, symptom3, symptom4))


if __name__ == "__main__":
    main()








