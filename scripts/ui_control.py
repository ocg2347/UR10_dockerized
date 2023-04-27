# """
# # UI Stuff
# ui_root = tk.Tk()
# x_label = tk.Label(ui_root, text='X').grid(row=3, column=1)
# x_minus = tk.Button(ui_root, text ="-", command = lambda:TranslateInOneAxis('x',-0.05)).grid(row=4, column=0, pady=40, padx = 40)
# x_plus  = tk.Button(ui_root, text ="+", command = lambda:TranslateInOneAxis('x',0.05)).grid(row=4, column=2, pady=40, padx = 40)
# y_label = tk.Label(ui_root, text='Y').grid(row=5, column=1)
# y_minus = tk.Button(ui_root, text ="-", command = lambda:TranslateInOneAxis('y',-0.05)).grid(row=6, column=0, pady=40, padx = 40)
# y_plus  = tk.Button(ui_root, text ="+", command = lambda:TranslateInOneAxis('y',0.05)).grid(row=6, column=2, pady=40, padx = 40)
# z_label = tk.Label(ui_root, text='Z').grid(row=7, column=1)
# z_minus = tk.Button(ui_root, text ="-", command = lambda:TranslateInOneAxis('z',-0.05)).grid(row=8, column=0, pady=40, padx = 40)
# z_plus  = tk.Button(ui_root, text ="+", command = lambda:TranslateInOneAxis('z',0.05)).grid(row=8, column=2, pady=40, padx = 40)
# """

# while not rospy.is_shutdown():
#     ui_root.update_idletasks()
#     ui_root.update()
#     rate.sleep()