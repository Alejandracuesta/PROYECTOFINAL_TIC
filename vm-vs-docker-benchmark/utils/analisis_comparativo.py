import matplotlib.pyplot as plt

# Datos de rendimiento comparativo
categorias = ['CPU', 'Memoria', 'Disco', 'Red', 'App Node.js']
docker_local = [650, 500, 2.0, 940, 950]
codespaces = [500, 600, 4.75, 200, 700]  # Nota: mayor uso de memoria y más latencia

x = range(len(categorias))

plt.figure(figsize=(10, 6))
plt.bar(x, docker_local, width=0.4, label='Docker Local', align='center')
plt.bar([i + 0.4 for i in x], codespaces, width=0.4, label='Codespaces', align='center')

plt.xticks([i + 0.2 for i in x], categorias)
plt.ylabel('Valor relativo (más alto = mejor)')
plt.title('Comparativa de Rendimiento: Docker Local vs Codespaces')
plt.legend()
plt.grid(True, linestyle='--', alpha=0.5)

plt.tight_layout()
plt.savefig("comparativa_rendimiento.png")
print("Gráfico generado: comparativa_rendimiento.png")
