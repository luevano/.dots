import os

HOME=os.environ['HOME'] + '/'
XCDIR=f'{HOME}.config/xcolors/'
CSLIST=os.listdir(XCDIR)
XRPATH=f'{HOME}.Xresources'
ALPATH=f'{HOME}.config/alacritty/alacritty.yml'


def update_xresources(csname):
    """
    Updates the ~/.Xresources file with new color scheme.
    """
    if csname not in CSLIST:
        return f"{csname} not in {XCDIR}"

    with open(XRPATH, 'r') as infile:
        lines = infile.readlines()

    with open(file_dir, 'w') as outfile:  
        for i, line in enumerate(lines):
            if i == 4:
                nline = line.split('/')
                nline[-1] = csname + '"\n'
                nline = '/'.join(nline)
                outfile.write(nline)
            else:
                outfile.write(line)


def update_alacritty(csname):
    """
    Updates the ~/.config/alacritty/alacritty.yml file with new color scheme.
    """
    if csname not in CSLIST:                 
        return f"{csname} not in {XCDIR}"
 
    with open(ALPATH, 'r') as infile:
        lines = infile.readlines()
    
    for line in lines:
        if 'background' in line:
            print(line)

    return None

    with open(file_dir, 'w') as outfile:  
        for i, line in enumerate(lines):
            if i == 4:
                nline = line.split('/')
                nline[-1] = csname + '"\n'
                nline = '/'.join(nline)
                outfile.write(nline)
            else:
                outfile.write(line)
