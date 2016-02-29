#! /usr/bin/env python
import sys, os, shutil, os.path, re, tempfile, glob

def makeout(l):
    global count
    name = base
    for j in range(l):
        update = i[j]
        update = update.replace('.','_')
        update = update.replace('-','_')
        name = name+var[j]+update

    fromdir = './'+base+'/'+name+'.raw/'
    oldfiles = [file for file in glob.glob(fromdir+'*') if file != fromdir+'logFile' and re.search("foreach", file) == None]
    newfiles = [re.sub('\d\d\d', '{:0>3}'.format(count), file) for file in oldfiles]
    newfiles = [file.split('/')[-1] for file in newfiles]
    [shutil.copy(oldfile, base+'.raw/'+newfile) for oldfile, newfile in zip(oldfiles, newfiles)]
    print newfiles
    count = count+1

# Variable Initialization
base = sys.argv[1]
stop = False
poststart = False
sub = 1
var = []
val = []
pre = []
post = []
i = [[],[],[],[],[],[],[],[],[]]
count = 0

# Create dummy raw directory for sweep setup
if not os.path.exists(base+'.raw') or raw_input("Existing raw dir found. Is this a new sweep setup? y/n: ") == 'y':
    if os.path.exists(base+'.raw'):
        shutil.rmtree(base+'.raw')
    tempdir = tempfile.mkdtemp(dir='.')
    os.chdir(tempdir)

    with open('temp.scs', 'w') as tempscs, open('../'+base+'.scs','r') as inputscs:
        netlist = inputscs.read()
        params = re.search(r'parameters[A-Za-z0-9_\-=. \\\n]*[^\\]\n', netlist)
        tempscs.write('simulator lang=spectre\n')
        tempscs.write('global 0\n')
        tempscs.write(params.group(0))
        for n in range(13):
            tempscs.write('R'+str(n)+' (net'+str(n)+' 0) resistor r=1K\n')
            tempscs.write('PORT'+str(n)+' (net'+str(n)+' 0) port r=50 type=sine\n')
        oddsandends = re.search('simulatorOptions.*', netlist, re.DOTALL).group(0)
        oddsandends = re.sub(r'(start=\S+\s+stop=\S+\s+)((lin|step|dec)=\S+)', r'\1lin=2,', oddsandends)
        tempscs.write(oddsandends)

    # reduce frequency sweeps to 2 points
    with open('../'+base+'.mdl','r') as inf, open(base+'.mdl', 'w') as outf:
        text = inf.read() 
        text = re.sub(r'(start=\S+\s+stop=\S+\s+)((lin|step|dec)=\S+)', r'\1lin=2,', text)
        outf.write(text)

    #os.system('spectremdl -batch ../'+base+'.mdl -design temp.scs -raw '+base+'.raw -64 +aps +mt=1')
    os.system('spectremdl -batch '+base+'.mdl -design temp.scs -raw '+base+'.raw -64')
    shutil.move(base+'.raw', '..')
    os.chdir('..')
    shutil.rmtree(tempdir)

[os.unlink(file) for file in glob.glob(base+'.raw/*') if file != base+'.raw/'+'logFile' and file.split('.')[-1] != "foreach"]

# Find sweeps from mdl file
with open(base+'.mdl','r') as inf:
    for line in inf.readlines():
        lines = line.strip()
        if lines.startswith('//NOFOREACH'):
            stop = True
            continue
        if stop:
            post.append(line)
            continue
        if lines.startswith('foreach') and lines.find('}')>0:
            poststart = True
            linetemp = lines[lines.find('foreach')+8:lines.find('from')-1]
            linetemp = linetemp.strip()
            var.append(linetemp)
            list = lines[lines.find('{')+1:lines.find('}')].split(',')
            for a in range(len(list)):
                list[a] = list[a].strip()
            val.append(list)
            sub *= len(list)
        else:
            if poststart:
                post.append(line)
            else:
                pre.append(line)
print var, val

l = len(var)
if l > 9:
    print "NOTE: This code can only handle up to 9 nested loops"
    print "      Since you're using more than 9 this code has abended"
    print "      Either reduce the number of loops to 9 or beg the developer"
    print "      to increase the limit"
    print " "
    sys.exit()

for i[0] in val[0]:
    if l>1:
        for i[1] in val[1]:
            if l>2:
                for i[2] in val[2]:
                    if l>3:
                        for i[3] in val[3]:
                            if l>4:
                                for i[4] in val[4]:
                                    if l>5:
                                        for i[5] in val[5]:
                                            if l>6:
                                                for i[6] in val[6]:
                                                    if l>7:
                                                        for i[7] in val[7]:
                                                            if l>8:
                                                                for i[8] in val[8]:
                                                                    makeout(l)
                                                            else:
                                                                makeout(l)
                                                    else:
                                                        makeout(l)
                                            else:
                                                makeout(l)
                                    else:
                                        makeout(l)
                            else:
                                makeout(l)
                    else:
                        makeout(l)
            else:
                makeout(l)
    else:
        makeout(l)
