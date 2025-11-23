PYTHON=(
  python
  python3
  python-pip
  python-gobject
  python3-gobject
  python-screeninfo
)

for py in "${PYTHON[@]}"; do
  yay -S --needed --noconfirm $py
done
