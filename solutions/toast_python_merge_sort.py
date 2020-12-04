from random import randint


def merge_sort(sortable):
    middle = round(len(sortable) / 2)
    if len(sortable) > 1:
        left, right = merge_sort(sortable[:middle]), merge_sort(sortable[middle:])
        left_pt = 0
        right_pt = 0
        sorted_list = []
        while left_pt < len(left) or right_pt < len(right):
            if right_pt >= len(right) or (
                left_pt < len(left) and left[left_pt] < right[right_pt]
            ):
                sorted_list.append(left[left_pt])
                left_pt += 1
            else:
                sorted_list.append(right[right_pt])
                right_pt += 1
        return sorted_list
    else:
        return sortable


random_list = [randint(0, 20) for k in range(20)]
sorted = merge_sort(random_list)

print(f"random_list has {len(random_list)} elements")
print(random_list)
print()
print(f"sorted has {len(sorted)} elements")
print(sorted)
print()
print(
    f"every element of sorted is",
    "not"
    if not all(sorted[k] <= sorted[k + 1] for k in range(len(sorted) - 1))
    else "indeed",
    "less than or equal to the next element",
)