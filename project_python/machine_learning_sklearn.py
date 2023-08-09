# ML for Regression Model
# import model

from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeRegressor
from sklearn.ensemble import RandomForestRegressor
from sklearn.neural_network import MLPRegressor
from sklearn.svm import SVR
from sklearn.kernel_ridge import KernelRidge
from sklearn.neighbors import KNeighborsRegressor
from sklearn.ensemble import BaggingRegressor
import pandas as pd
from math import sqrt
import numpy as np


# load data
mtcars = pd.read_csv("https://gist.githubusercontent.com/seankross/a412dfbd88b3db70b74b/raw/5f23f993cd87c283ce766e7ac6b329ee7cc2e1d1/mtcars.csv")

mtcars.head()


# prepare
# mpg = f(hp, wt, am)
X = mtcars[[ "hp", "wt", "am"]]
y = mtcars[ "mpg" ]

# split 80:20 Data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=26)

# train model & Compare Result
models = [LinearRegression(), DecisionTreeRegressor(), RandomForestRegressor(), MLPRegressor(), SVR(), KernelRidge(), KNeighborsRegressor(), BaggingRegressor()]

result = []

for model in models:
    model.fit(X_train, y_train)
    pred = model.predict(X_test)

    mae = np.mean(np.absolute(y_test - pred))
    mse = np.mean(np.square(y_test - pred))
    rmse = sqrt(np.mean(np.square(y_test - pred)))

    row = [str(model), mae, mse, rmse]
    result.append(row)


df_result = pd.DataFrame(result, columns = ["Model", "MAE", "MSE", "RMSE"])

# Sort Performance by RMSE
df_result.sort_values("RMSE").reset_index(drop=True)
