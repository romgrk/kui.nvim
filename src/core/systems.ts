export const byName = {} as Record<string, any>

export function register(name: string, classRef: any) {
  byName[name] = classRef
}

export function get(name: string) {
  return byName[name]
}

export default { byName, register, get }
