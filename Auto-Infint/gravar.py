import keyboard # type: ignore
import time

log = []  # Lista para armazenar os eventos de teclas

# Limite mínimo para considerar um evento válido (em milissegundos)
MIN_DURATION_MS = 50

def on_key_press(event):
    # Registra quando uma tecla é pressionada
    if event.event_type == 'down':
        # Verifica se a tecla já está pressionada (evita eventos duplicados)
        if not any(item['key'] == event.name and item['end'] is None for item in log):
            log.append({'key': event.name, 'start': time.perf_counter(), 'end': None})

def on_key_release(event):
    # Registra quando uma tecla é solta
    if event.event_type == 'up':
        for item in reversed(log):  # Procura o último evento da tecla que ainda não foi finalizado
            if item['key'] == event.name and item['end'] is None:
                item['end'] = time.perf_counter()
                break

# Hooks para monitorar pressionamento e soltura de teclass
keyboard.hook(on_key_press)
keyboard.hook(on_key_release)

print("Gravando... Pressione ESC para parar.")
keyboard.wait('esc')  # Aguarda até que a tecla ESC seja pressionada

# Gera o arquivo de saída no formato desejado
with open("output.txt", "w") as f:
    for i, item in enumerate(log):
        if item['end'] is not None:
            # Calcula o tempo que a tecla ficou pressionada (em milissegundos)
            duration = int((item['end'] - item['start']) * 1000)
            
            # Ignora eventos com duração menor que o limite mínimo
            if duration < MIN_DURATION_MS:
                continue
            hentai = '"{'
            hentai2 = '}"'
            
            # Escreve o comando "SendInput" para pressionar a tecla
            f.write('SendInput({}{} down{})\n'.format(hentai, item["key"], hentai2))
            f.write(f"    Sleep {duration}\n")  # Tempo que a tecla ficou pressionada
            f.write('SendInput({}{} up{})\n'.format(hentai, item["key"], hentai2))
            
            # Adiciona um Sleep de 100 ms entre as teclas (exceto após a última tecla)
            if i < len(log) - 1:
                f.write("    Sleep 100\n")

print("Gravação concluída. Saída salva em 'output.txt'.")