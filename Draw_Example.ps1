<#
.SYNOPSIS
Example Script to show how you can use background colors to draw images in the PowerShell console.

.DESCRIPTION
This script uses arrays and background colors from the Write-Host module to make it possible to display images in the console.

.PARAMETER drawArray
The name of the array to draw in the console.

.PARAMETER LengthMultiplier
You can provide a number to multiply the width of the passed array.

.PARAMETER Color#
Depending on the array passed you can select multiple different colors.

.EXAMPLE
Display a bomb with a LengthMultiplier
Start-Draw $bomb -LengthMultiplier 2 -Color1 White -Color2 Yellow -Color3 Black

.EXAMPLE 
Display Game Over excluding background color.
Start-Draw $gameOver -Color1 None -Color2 Black

.NOTES
This is only an example of what you could do with drawing in the console and can be greatly expanded upon.

The console only supports the following colors:
Black
DarkBlue
DarkGreen
DarkCyan
DarkRed
DarkMagenta
DarkYellow
Gray
DarkGray
Blue
Green
Cyan
Red
Magenta
Yellow
white

The Array is built in this format:
$array = @((Line spacing for color),
           (Number to associate to color in image. Using a different number would indicate unique color),
           (0 = Go to new line, 1 = Stay on same line))

#>





$gameOver = @((32,3,5,3,3,3,2,3,2,1,6,1,2,2,6,2,1,2,2,3,1,3,1,2,5,1,2,6,2,3,2,1,7,1,2,5,1,2,2,3,1,2,3,2,1,7,1,5,2,1,2,3,2,1,7,1,2,1,1,1,2,1,2,5,2,2,2,2,1,2,3,2,1,2,3,2,1,2,5,3,5,1,2,3,2,1,2,3,2,1,6,1,32,2,5,2,2,3,2,1,`
                 6,1,6,2,1,2,3,2,1,2,3,2,1,2,5,2,3,2,1,1,2,3,2,1,2,3,2,1,2,5,2,3,2,1,1,2,3,2,1,2,3,2,1,5,2,2,2,3,1,1,2,3,2,2,2,1,2,2,2,5,5,3,1,2,3,2,3,3,3,2,5,2,1,3,2,2,5,5,1,4,6,1,2,2,3,1,32),
              (1,1,2,1,2,1,2,1,2,1,2,1,1,2,1,2,1,2,1,2,1,2,1,2,1,1,2,1,2,1,2,1,2,1,2,1,1,2,1,2,1,2,1,2,1,2,1,2,1,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,1,2,1,2,1,2,1,2,1,2,1,2,1,1,1,2,1,2,1,2,1,2,1,`
                 2,1,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,1,2,1,2,1,2,1,2,1,2,1,2,1,1,2,1,2,1,2,1,2,1,2,1,2,1,1,2,1,2,1,2,1,2,1,2,1,1),
              (0,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,`
                 1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,0,0))

$bomb = @((21,5,1,15,1,1,3,1,15,2,1,2,1,3,3,9,3,1,4,1,3,1,8,5,3,5,1,7,3,1,9,1,7,2,1,2,1,7,1,7,1,1,3,1,5,5,5,5,1,5,5,5,9,9,3,8,6,2,3,2,8,8,1,2,2,7,10,1,2,1,7,10,1,2,1,7,13,1,7,13,1,7,13,1,8,11,2,8,11,2,9,9,3,11,5,5,21),
          (1,1,2,1,1,2,1,2,1,1,2,1,2,1,3,1,1,2,1,3,1,3,1,1,3,1,3,1,1,2,1,3,1,1,2,1,2,1,3,1,1,2,1,2,1,3,1,1,2,1,3,1,1,3,1,1,3,1,3,1,1,3,1,3,1,1,3,1,3,1,1,3,1,3,1,1,3,1,1,3,1,1,3,1,1,3,1,1,3,1,1,3,1,1,3,1,1),
          (0,1,1,0,1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,0,1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,0,1,1,0,1,1,1,1,0,1,1,1,1,0,1,1,1,1,0,1,1,1,1,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1,0,0))





#[string]$consoleSpace = ""

function buildDrawLine {
        Param(
        [int]$length,
        [string]$Color,
        [switch]$NoNewline
        )
        $i=0 #Reset loop counter

        while ($i -lt $length) {
            
            $consoleSpace = $consoleSpace + [char]0x00A0
            $i++ #Increment loop counter

            }

        if ($NoNewline -eq $true -and $Color -eq "None") {
            Write-Host $consoleSpace -NoNewline
            }

        elseif ($NoNewline -eq $false -and $Color -eq "None") {
            Write-Host $consoleSpace
            }

        elseif ($NoNewline -eq $true) {
            Write-Host $consoleSpace -BackgroundColor $color -NoNewline
            }

        else {
            Write-Host $consoleSpace -BackgroundColor $color
            }


       }





function Start-Draw {
    Param
    (
         [Parameter(Mandatory=$true)]
         $drawArray,
         $LengthMultiplier = 1,
         $Color1 = "White",
         $Color2 = "White",
         $Color3 = "White"
    )

    $currentColorArray = @("",$Color1,$Color2,$Color3)

    $arrayPosition = 0

    while ($arrayPosition -ne $drawArray[0].Length) {
        $length = ($drawArray[0][$arrayPosition])*$LengthMultiplier

        if ($drawArray[2][$arrayPosition] -eq 0) {
            buildDrawLine -length $length -Color $currentColorArray[$drawArray[1][$arrayPosition]]
            }

        elseif ($drawArray[2][$arrayPosition] -eq 1) {
            buildDrawLine -length $length -Color $currentColorArray[$drawArray[1][$arrayPosition]] -NoNewline
            }

        $arrayPosition++
        #$percentComplete = (($arrayPosition/($drawArray[0].Length))*100)
        #Write-Progress -Activity "Drawing..." -Status "$percentComplete% Complete:" -PercentComplete $percentComplete
        }
    }





<#
#Uncomment this block to view a demo of supported console colors
#Example Colors

buildDrawLine -length 5 -Color Black -NoNewline
buildDrawLine -length 5 -Color DarkBlue -NoNewline
buildDrawLine -length 5 -Color DarkGreen -NoNewline
buildDrawLine -length 5 -Color DarkCyan -NoNewline
buildDrawLine -length 5 -Color DarkRed -NoNewline
buildDrawLine -length 5 -Color DarkMagenta -NoNewline
buildDrawLine -length 5 -Color DarkYellow -NoNewline
buildDrawLine -length 5 -Color Gray -NoNewline
buildDrawLine -length 5 -Color DarkGray -NoNewline
buildDrawLine -length 5 -Color Blue -NoNewline
buildDrawLine -length 5 -Color Green -NoNewline
buildDrawLine -length 5 -Color Cyan -NoNewline
buildDrawLine -length 5 -Color Red -NoNewline
buildDrawLine -length 5 -Color Magenta -NoNewline
buildDrawLine -length 5 -Color Yellow -NoNewline
buildDrawLine -length 5 -Color white
#>





cls
Start-Draw $bomb -LengthMultiplier 2 -Color1 None -Color2 Yellow -Color3 Black
Start-Sleep -Milliseconds 200
cls
Start-Draw $bomb -LengthMultiplier 2 -Color1 None -Color2 Blue -Color3 White
Start-Sleep -Milliseconds 200
cls
Start-Draw $bomb -LengthMultiplier 2 -Color1 None -Color2 Yellow -Color3 Black
Start-Sleep -Milliseconds 200
cls
Start-Draw $bomb -LengthMultiplier 2 -Color1 None -Color2 Blue -Color3 White
Start-Sleep -Milliseconds 200
cls

Start-Draw $gameOver -Color1 None -Color2 Black
Start-Sleep -Milliseconds 200
cls
Start-Draw $gameOver -Color1 None -Color2 Red
Start-Sleep -Milliseconds 200
cls
Start-Draw $gameOver -Color1 None -Color2 Black
Start-Sleep -Milliseconds 200
cls
Start-Draw $gameOver -Color1 None -Color2 Red
Start-Sleep -Milliseconds 200
cls
Start-Draw $gameOver -Color1 White -Color2 Black
Pause