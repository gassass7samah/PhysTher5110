import pandas as pd
import numpy as np
from scipy import stats
# import r-ggplot2 as gg
import os

os.chdir("C:/Users/kelop/OneDrive/Documents/GitHub/PhysTher5110/")
os.listdir()

os.listdir("./data")


# 1.0 Plotting Discrete Data
# Load the data
DAT1 = pd.read_csv("./data/data_ANSCOMBE.csv")
print(DAT1.head())

# Regression Coefficients
COEFS = DAT1.groupby('group').agg(
    Intercept=('yVal', lambda x: stats.linregress(x, DAT1.loc[x.index, 'xVal']).intercept),
    Slope=('yVal', lambda x: stats.linregress(x, DAT1.loc[x.index, 'xVal']).slope),
    MeanY=('yVal', 'mean'),
    SDY=('yVal', 'std'),
    MeanX=('xVal', 'mean'),
    SDX=('xVal', 'std')
).reset_index()

print(COEFS)

# Visualizing All the Data
g = sns.FacetGrid(data=DAT1, col='group', col_wrap=2)
g.map_dataframe(sns.scatterplot, x='xVal', y='yVal', hue='group', palette='Set1', marker='o')
g.map_dataframe(sns.regplot, x='xVal', y='yVal', scatter=False, color='k')
g.set_axis_labels("X Values", "Y Values")
g.set_titles("Group {col_name}")
g.set(ylim=(0, 15))
plt.show()

# Disctrete Categorical Data
DAT2 = pd.read_csv("./data/data_FINAL_RATINGS.csv")
print(DAT2.head())

# Just the means
MEANS = DAT2.groupby(['Elevation', 'Speed'])['Effort'].agg(['mean', 'count', 'std']).reset_index()
MEANS.columns = ['Elevation', 'Speed', 'ave_Effort', 'N', 'SD']
print(MEANS)

g = sns.FacetGrid(data=MEANS, col='Speed', sharey=False)
g.map(sns.barplot, 'Elevation', 'ave_Effort', palette='Set1')
g.set_axis_labels("Elevation", "Effort (%)")
g.set_titles("Speed {col_name}")
g.set(ylim=(0, 100))
plt.show()
plt.clf()

# Means with Standard errors
e = sns.FacetGrid(data=DAT2, col='Speed', sharey=False)
e.map(sns.barplot, 'Elevation', 'ave_Effort', palette='Set1', errorbar="sd", errcolor="k")
e.set_axis_labels("Elevation", "Effort (%)")
e.set_titles("Speed {col_name}")
e.set(ylim=(0, 100))
plt.show()
plt.clf()


# All the data
# Define custom colors
custom_colors = ["#E69F00", "#56B4E9"]

# Create the scatter plot with facets
g = sns.FacetGrid(data=DAT2, col='Speed', hue='Speed', sharey=False)
g.map(sns.scatterplot, 'Elevation', 'Effort', marker='o', palette=custom_colors, s=50, alpha=0.8)
g.set_axis_labels("Elevation", "Effort (%)")
g.set(ylim=(0, 100))
g.despine(left=True, bottom=True)

# Customize font size and style
g.set_titles(size=16, fontweight='bold')
g.set_xticklabels(fontsize=16, color="black")
g.set_yticklabels(fontsize=16, color="black")
g.set_xlabels(fontsize=16, fontweight='bold')
g.set_ylabels(fontsize=16, fontweight='bold')

plt.show()




