import warnings
warnings.simplefilter(action='ignore', category=FutureWarning)
#Zaradi preprostosti sem se odločila zemljevid prikazati s pomočjo paketa 'folium'.
#Ker je to že zastarel paket nam na začetku izpiše opozorilo, zaradi same čistosti
#poročila, sem uvozila še paket 'warnings', ki to sporočilo skrije.

import pandas as pd
import matplotlib.pyplot as plt
import folium
import os

a = pd.read_csv('zasebne.csv', encoding = 'utf-8')


state_geo = os.path.join('/Users/Ines Šilc/Documents/FTI-Seminarska-naloga', 'grafi_zemljevidi/us-states.json')
state_data = os.path.join('/Users/Ines Šilc/Documents/FTI-Seminarska-naloga', 'grafi_zemljevidi/zasebne.csv')

#Osnovni zemljevid
m = folium.Map(location=[38, -96], zoom_start = 4)


#Dodamo specifikacije barve
m.choropleth(
 geo_data=state_geo,
 name='choropleth',
 data=a,
 columns=['state', '2019'],
 key_on='feature.id',
 fill_color='YlGn',
 fill_opacity=0.6,
 line_opacity=0.3,
 legend_name='Skupna vrednost fundacij zasebnih univerz v zvezni državi'
)
folium.LayerControl().add_to(m)

m.save('zemljevid_zasebnih.html')

####################################
b = pd.read_csv('javne.csv', encoding = 'utf-8')

state_geo = os.path.join('/Users/Ines Šilc/Documents/FTI-Seminarska-naloga', 'grafi_zemljevidi/us-states.json')
state_data = os.path.join('/Users/Ines Šilc/Documents/FTI-Seminarska-naloga', 'grafi_zemljevidi/javne.csv')

#Osnovni zemljevid
m = folium.Map(location=[38, -96], zoom_start = 4)

m.choropleth(
 geo_data=state_geo,
 name='choropleth',
 data=b,
 columns=['state', '2019'],
 key_on='feature.id',
 fill_color='OrRd',
 fill_opacity=0.6,
 line_opacity=0.3,
 legend_name='Skupna vrednost fundacij javnih univerz v zvezni državi'
)
folium.LayerControl().add_to(m)

m.save('zemljevid_javnih.html')






















