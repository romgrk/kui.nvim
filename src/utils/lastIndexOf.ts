export default function lastIndexOf(haystack: string, needle: string) {
    let i = -1
    let j = -1
    let k = 0
    do {
        i = j;
        [j, k] = string.find(haystack, needle, k + 1, true)
    }
    while (j !== null)

    return i
}
