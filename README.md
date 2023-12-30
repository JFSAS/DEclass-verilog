# DEclass-verilog
今天在使用mac完成项目时发现，mac会在每一个文件夹内自动生成.DS_Store文件。在.gitignore中添加一行.DS_Store来忽略这个文件夹.但由于在第一次commit时已经将这个文件添加到了git追踪中，再添加.gitignore不会将已跟踪的文件删除，需要手动使用git rm --vached filename 来去掉该文件。
但.DS_Store文件分散在每个子文件夹中。手动去除很繁琐。
于是利用git ls-files --ignored --exclude-standard -z -c | xargs -0 git rm --cached
指令来去除所有子文件夹中的ignore文件
前半部分得到所有ignore文件的相对地址，输出给到git rm
xargs -0 git rm --cached 会接收 git ls-files 命令的输出，并使用 git rm --cached 命令来停止追踪这些文件。-0 选项告诉 xargs 它的输入使用 null 字符分隔。
gtkwave不能存在中文路径