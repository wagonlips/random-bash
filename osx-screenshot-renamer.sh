#!/bin/sh
# This script will change the default OS X screenshot filenames to 24 hour time format and take the spaces out.
# The expected filename format is something like "Screen shot 2013-08-28 at 7.53.49 AM.png" 
# The spaces will be replaced with hyphens. Modify the $fullname variable if a different separator is desired.
# Make it executable, invoke it (./osx-screenshot-renamer.sh) and it will change all the applicable filenames in the same directory.
# This script will *not* make backups first! No undo!
for i in *.png
do 
# Only mess with filenames that have spaces in them.
        if [[ $i == *" "* ]]
        then
        # Cut the filenames up using spaces as the delimiter.
           aname=`echo $i | cut -d ' ' -f 1`
           bname=`echo $i | cut -d ' ' -f 2`
           cname=`echo $i | cut -d ' ' -f 3`
           dname=`echo $i | cut -d ' ' -f 4`
           ename=`echo $i | cut -d ' ' -f 5`
           fname=`echo $i | cut -d ' ' -f 6`
           gname=`echo $i | cut -d ' ' -f 7`
                # Sometimes OS X adds an increment after the AM/PM. If that's happened, we'll simply combine it with the filename's extension.
                if [ -n "$gname" ]
                then
                        fname=$fname-$gname
                fi
                # We'll treat the AM filenames here.
                if [[ $i == *AM* ]]
                then
                # Add zeros in front of the single digit hour numbers.
                        case ${ename} in 
                            (1.*)
                               ename=`echo $ename | sed 's/1/01/'`
                            ;;
                            (2.*)
                               ename=`echo $ename | sed 's/2/02/'`
                            ;;
                            (3.*)
                               ename=`echo $ename | sed 's/3/03/'`
                            ;;
                            (4.*)
                               ename=`echo $ename | sed 's/4/04/'`
                            ;;
                            (5.*)
                               ename=`echo $ename | sed 's/5/05/'`
                            ;;
                            (6.*)
                               ename=`echo $ename | sed 's/6/06/'`
                            ;;
                            (7.*)
                               ename=`echo $ename | sed 's/7/07/'`
                            ;;
                            (8.*)
                               ename=`echo $ename | sed 's/8/08/'`
                            ;;
                            (9.*)
                               ename=`echo $ename | sed 's/9/09/'`
                            ;;
                        esac
                # Re-combine everything into a complete filename again.
                fullname=$aname-$bname-$cname-$dname-$ename-$fname
                echo $fullname $i
                # And rename.
                mv "$i" "$fullname"
                fi
                # Here we'll treat the PM filenames.
                if [[ $i == *PM* ]]
                then
                # Just like the AMs, swap in zeros in front of the single digit hour numbers.
                        case ${ename} in 
                            (1.*)
                               ename=`echo $ename | sed 's/1/01/'`
                            ;;
                            (2.*)
                               ename=`echo $ename | sed 's/2/02/'`
                            ;;
                            (3.*)
                               ename=`echo $ename | sed 's/3/03/'`
                            ;;
                            (4.*)
                               ename=`echo $ename | sed 's/4/04/'`
                            ;;
                            (5.*)
                               ename=`echo $ename | sed 's/5/05/'`
                            ;;
                            (6.*)
                               ename=`echo $ename | sed 's/6/06/'`
                            ;;
                            (7.*)
                               ename=`echo $ename | sed 's/7/07/'`
                            ;;
                            (8.*)
                               ename=`echo $ename | sed 's/8/08/'`
                            ;;
                            (9.*)
                               ename=`echo $ename | sed 's/9/09/'`
                            ;;
                        esac
                        # Now we'll add 12 to the hour numbers.
                        ename1=`echo $ename | cut -d '.' -f 1`
                        ename2=`echo $ename | cut -d '.' -f 2`
                        ename3=`echo $ename | cut -d '.' -f 3`
                        if [[ $ename1 < 12 ]]
                        then
                                ename1=`expr $ename1 + 12`
                        fi
                        # Re-combine filenames.
                        fulltime=$ename1.$ename2.$ename3
                fullname=$aname-$bname-$cname-$dname-$fulltime-$fname
                echo $fullname $i
                # And do the renaming.
                mv "$i" "$fullname"
                fi
        fi
done
exit 0
# Woot!
