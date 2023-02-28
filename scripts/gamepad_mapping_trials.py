from gamepad import Gamepad
import time
import numpy as np
import matplotlib.pyplot as plt

gamepadType = Gamepad.LogitechRumblePad2
if not Gamepad.available():
    print('Please connect your gamepad...')
    while not Gamepad.available():
        time.sleep(1.0)

gamepad = gamepadType()
gamepad.startBackgroundUpdates()
dt = 1e-3

theta = np.linspace(0, 2*np.pi, 100)
x = np.cos(theta)
y = np.sin(theta)

plt.ion()

fig = plt.figure(figsize=(8, 8))
ax = fig.add_subplot(111)
line1, = ax.plot(x, y)
line2, = ax.plot([0,0], [0,0], 'ro')

v = np.array([0.0, 0.0, 0.0], dtype=np.float32)

def normalize_velocity(v):
    tan_theta = v[1]/v[0]
    if abs(tan_theta) > 1.0:
        R_v = np.sqrt(1/(tan_theta**2)+1)
    else:
        R_v = np.sqrt(1+tan_theta**2)
    v = v/R_v
    return v

while (True) and gamepad.isConnected():
    # eventType, control, value = gamepad.getNextEvent()
    v[1]=-gamepad.axis('LEFT-Y') # [-1,1]
    v[0]=gamepad.axis('LEFT-X') # [-1,1]
    # if gamepad.beenPressed('L1'): # ascent
    #     v[2] = 1.0
    # elif gamepad.beenReleased('L1'):
    #     v[2] = 0.0
    # if v[2]==0.0 and gamepad.beenPressed('R1'):
    #     v[2] = -1.0
    # elif gamepad.beenReleased('R1'):
    #     v[2] = 0.0
    print(v)
    v = normalize_velocity(v)
    line2.set_data([0, v[0]], [0, v[1]])
    fig.canvas.draw()
    fig.canvas.flush_events()
    time.sleep(dt)