from flask import Flask, request, render_template
import joblib

app = Flask(__name__)

modelo_dsa_final = joblib.load('modelo_dsa_treinado.pkl')

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/predict', methods=['POST'])
def predict():
    features = [float(x) for x in request.form.values()]
    
    final_features = [features]
    
    prediction = modelo_dsa_final.predict(final_features)
    
    return render_template('index.html', prediction_text = f'Previsao do modelo (1 - Cliente fara outra compra / 0 - Cliente nao fara outra compra): {prediction[0]}')

if __name__ == '__main__':
    app.run(debug=True)