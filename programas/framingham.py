import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report, confusion_matrix, roc_auc_score
from statsmodels.stats.outliers_influence import variance_inflation_factor
import statsmodels.api as sm

# Nota: Se asume que el archivo 'framingham.csv' está disponible en el entorno.
# El dataset típico contiene: male, age, education, currentSmoker, cigsPerDay, 
# BPMeds, prevalentStroke, prevalentHyp, diabetes, totChol, sysBP, diaBP, BMI, 
# heartRate, glucose, TenYearCHD.
# dataset
disease_df = pd.read_csv("/kaggle/input/framingham-heart-study-dataset/framingham.csv")
# disease_df.drop(['education'], inplace = True, axis = 1)
# disease_df.rename(columns ={'male':'Sex_male'}, inplace = True)
# disease_df.head()

filepath = "https://patricioaraneda.cl/bioestadistica/data/framingham.csv"

def cargar_y_limpiar_datos(filepath):
    """
    Carga el dataset y maneja los valores faltantes, comunes en datos médicos.
    """
    df = pd.read_csv(filepath)
    df.drop(['education'], inplace = True, axis = 1)
    
    # Análisis de valores nulos
    print("Valores nulos detectados por columna:\n", df.isnull().sum())
    
    # Imputación: Usamos la mediana para variables continuas para evitar sesgos por outliers
    for col in df.columns:
        if df[col].isnull().any():
            df[col] = df[col].fillna(df[col].median())
            
    return df

def analisis_exploratorio(df):
    """
    Genera visualizaciones para entender la distribución del riesgo.
    """
    plt.figure(figsize=(12, 6))
    
    # Distribución de la Edad vs Riesgo a 10 años
    plt.subplot(1, 2, 1)
    sns.histplot(data=df, x='age', hue='TenYearCHD', kde=True, element="step")
    plt.title('Distribución de Edad por Riesgo de CHD')
    
    # Correlación de factores principales
    plt.subplot(1, 2, 2)
    cols_interes = ['age', 'totChol', 'sysBP', 'diaBP', 'BMI', 'heartRate', 'glucose']
    sns.heatmap(df[cols_interes].corr(), annot=True, cmap='coolwarm', fmt=".2f")
    plt.title('Matriz de Correlación de Factores Clínicos')
    
    plt.tight_layout()
    plt.show()

def ejecutar_regresion_logistica(df):
    """
    Implementa el modelo de Regresión Logística para predicción de riesgo.
    """
    # Definición de variables independientes (X) y dependiente (y)
    X = df.drop('TenYearCHD', axis=1)
    y = df['TenYearCHD']
    
    # División entrenamiento/prueba
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    
    # Escalado de variables (opcional pero recomendado para convergencia)
    # model = LogisticRegression(max_iter=1000)
    
    # Usamos statsmodels para obtener un reporte estadístico detallado (P-values)
    X_train_const = sm.add_constant(X_train)
    logit_model = sm.Logit(y_train, X_train_const).fit()
    
    print("\n--- Resumen Estadístico del Modelo (Logit) ---")
    print(logit_model.summary())
    
    # Predicción con Scikit-Learn para métricas de desempeño
    sk_model = LogisticRegression(max_iter=2000)
    sk_model.fit(X_train, y_train)
    y_pred = sk_model.predict(X_test)
    
    print("\n--- Reporte de Clasificación ---")
    print(classification_report(y_test, y_pred))
    print("AUC-ROC Score:", roc_auc_score(y_test, sk_model.predict_proba(X_test)[:, 1]))

def main():
    # Simulación de carga (sustituir por ruta real si es necesario)
    try:
        # Nota: Como no tengo el archivo físico, este bloque es demostrativo.
        # En un entorno real, usarías: df = cargar_y_limpiar_datos('framingham.csv')
        print("Iniciando análisis científico del estudio Framingham...")
        
        # Generamos datos sintéticos similares para que el script sea ejecutable/demostrable
        data_size = 500
        np.random.seed(42)
        mock_data = pd.DataFrame({
            'age': np.random.randint(30, 70, data_size),
            'totChol': np.random.normal(230, 40, data_size),
            'sysBP': np.random.normal(130, 20, data_size),
            'diaBP': np.random.normal(85, 10, data_size),
            'BMI': np.random.normal(25, 4, data_size),
            'heartRate': np.random.normal(75, 10, data_size),
            'glucose': np.random.normal(80, 15, data_size),
            'TenYearCHD': np.random.binomial(1, 0.15, data_size)
        })
        
        analis_exploratorio(mock_data)
        ejecutar_regresion_logistica(mock_data)
        
    except Exception as e:
        print(f"Error durante la ejecución: {e}")

if __name__ == "__main__":
    main()