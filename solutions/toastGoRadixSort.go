package main

import (
	"fmt"
	"math/rand"
	"strconv"
	"time"
)

var length int = 20

func radSort(inputArray []int, maxDigits int) []int {
	sortedish := make([]int, len(inputArray))
	copy(sortedish, inputArray)
	for i := 0; i < maxDigits; i++ {
		buckets := make(map[int][]int)
		for j := 0; j < len(inputArray); j++ {
			numString := strconv.Itoa(sortedish[j])
			valueOfDigit := 0
			if len(numString) > i {
				valueOfDigit, _ = strconv.Atoi(string(numString[len(numString)-i-1]))
			}
			buckets[valueOfDigit] = append(buckets[valueOfDigit], sortedish[j])
		}
		sortedish = make([]int, 0, len(inputArray))
		for b := 0; b <= 9; b++ {
			sortedish = append(sortedish, buckets[b]...)
		}
	}
	return sortedish
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
	fmt.Println(radSort(randomArray, 3))
}
