package main

import (
	"fmt"
	"math/rand"
	"time"
)

var length = 20

// full disclosure --
// i looked at an implementation online bc I got stuck and frustrated :(
func quickSort(arr []int) []int {
	if len(arr) < 2 {
		return arr
	}
	pivot := 0
	leftEdge, rightEdge := 0, len(arr)-1
	arr[pivot], arr[rightEdge] = arr[rightEdge], arr[pivot]
	for i := range arr {
		if arr[i] < arr[rightEdge] {
			arr[leftEdge], arr[i] = arr[i], arr[leftEdge]
			leftEdge++
		}
	}

	arr[leftEdge], arr[rightEdge] = arr[rightEdge], arr[leftEdge]

	quickSort(arr[:leftEdge])
	quickSort(arr[leftEdge+1:])

	return arr
}

func main() {
	r := rand.New(rand.NewSource(time.Now().UnixNano()))
	randomArray := make([]int, length)
	for i := 0; i < length; i++ {
		randomArray[i] = r.Intn(999)
	}
	fmt.Print("Random array: ")
	fmt.Println(randomArray)
	fmt.Print("Sorted array: ")
	fmt.Println(quickSort(randomArray))
}
