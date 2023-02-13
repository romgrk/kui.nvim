export class Disposer {
  tasks: Function[] = []
  add(task: Function) {
    this.tasks.push(task)
  }
  destroy() {
    this.tasks.forEach(t => t())
  }
}
