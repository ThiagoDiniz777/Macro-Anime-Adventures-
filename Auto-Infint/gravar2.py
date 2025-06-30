import keyboard
import time
from pynput import mouse
import pygetwindow as gw

# Lista para armazenar os eventos de teclas e cliques do mouse
log = []
MIN_DURATION_MS = 50  # Limite mínimo para considerar um evento válido (em milissegundos)

# Nome da janela específica onde os cliques serão registrados
TARGET_WINDOW_TITLE = "Roblox"  # Substitua pelo título exato da janela

def on_key_press(event):
    # Registra quando uma tecla é pressionada
    if event.event_type == 'down':
        if not any(item['key'] == event.name and item['end'] is None for item in log):
            log.append({'type': 'key', 'key': event.name, 'start': time.perf_counter(), 'end': None})

def on_key_release(event):
    # Registra quando uma tecla é solta
    if event.event_type == 'up':
        for item in reversed(log):
            if item['type'] == 'key' and item['key'] == event.name and item['end'] is None:
                item['end'] = time.perf_counter()
                break

def on_click(x, y, button, pressed):
    # Verifica se o clique ocorreu na janela específica
    try:
        target_window = gw.getWindowsWithTitle(TARGET_WINDOW_TITLE)[0]
        if target_window.isMinimized:
            return  # Ignora cliques se a janela estiver minimizada

        window_left, window_top, window_right, window_bottom = (
            target_window.left,
            target_window.top,
            target_window.right,
            target_window.bottom,
        )

        if window_left <= x <= window_right and window_top <= y <= window_bottom:
            if pressed:
                log.append({'type': 'mouse', 'action': 'click', 'x': x - window_left, 'y': y - window_top})
    except IndexError:
        pass  # A janela não foi encontrada

# Hooks para monitorar pressionamento e soltura de teclas
keyboard.hook(on_key_press)
keyboard.hook(on_key_release)

# Inicia o listener do mouse
mouse_listener = mouse.Listener(on_click=on_click)
mouse_listener.start()

print("Gravando... Pressione ESC para parar.")
keyboard.wait('esc')  # Aguarda até que a tecla ESC seja pressionada

# Gera o arquivo de saída no formato desejado
with open("output.txt", "w") as f:
    for i, item in enumerate(log):
        if item['type'] == 'key':
            if item['end'] is not None:
                duration = int((item['end'] - item['start']) * 1000)
                if duration < MIN_DURATION_MS:
                    continue
                hentai = '"{'
                hentai2 = '}"'

                f.write(f'SendInput({hentai}{item["key"]} down{hentai2})\n')
                f.write(f"    Sleep {duration}\n")
                f.write(f'SendInput({hentai}{item["key"]} up{hentai2})\n')

                if i < len(log) - 1:
                    f.write("    Sleep 100\n")
        elif item['type'] == 'mouse' and item['action'] == 'click':
            f.write(f'BetterClick({item["x"]}, {item["y"]})\n')

print("Gravação concluída. Saída salva em 'output.txt'.")